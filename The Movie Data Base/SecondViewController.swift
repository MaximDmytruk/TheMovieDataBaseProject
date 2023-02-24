//
//  SecondViewController.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 03.02.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var filmsArray:[MovieJSONModel] = []
    var tvSeriesArray:[TvSeriesJSONModel] = []
    
    var dataBase = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.cornerRadius = 20
        
        dataBase.delegate = self
        dataBase.exportDataFromManager()
       
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataBase.exportDataFromManager()
        tableView.reloadData()
        
    }
    //MARK: - Category Segmented Control Action
    @IBAction func changeCategoryAction(_ sender: UISegmentedControl) { tableView.reloadData() }
}

extension SecondViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            return filmsArray.count
        case 1:
            return tvSeriesArray.count
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            cell.configureCell(result: filmsArray[indexPath.row])
            return cell
        case 1:
            cell.configureCell(result: tvSeriesArray[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else { return }
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            detailViewController.configureDetail (result: filmsArray[indexPath.row])
            navigationController?.pushViewController(detailViewController, animated: true)
        case 1:
            detailViewController.configureDetail(result: tvSeriesArray[indexPath.row])
            navigationController?.pushViewController(detailViewController, animated: true)
        default: break
        }
    }
}

extension SecondViewController:DataManagerDelegate {
    
    func saveDataMovie() -> MovieJSONModel? { return filmsArray[0] } /// never use
    func saveDataTv() -> TvSeriesJSONModel? { return tvSeriesArray[0] } /// never use
    
    func exportData(movies:[Any]){
        if movies is [MovieJSONModel] {
            filmsArray = movies as! [MovieJSONModel]
        }
        if movies is [TvSeriesJSONModel] {
            tvSeriesArray = movies as! [TvSeriesJSONModel]
        }
    }
}
