//
//  MainViewController.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 03.02.2023.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var filmsArray:[MovieJSONModel] = []
    var filmsId:[Int] = []
    
    var tvSeriesArray:[TvSeriesJSONModel] = []
    var tvSeriesId:[Int] = []
    
    var searchFilmsId:[Int] = []
    var searchFilms:[MovieJSONModel] = []
    var searchTvSeriesId:[Int] = []
    var searchTvSeries:[TvSeriesJSONModel] = []
    var searchStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.layer.cornerRadius = 15
        tableView.layer.cornerRadius = 20
        categorySegmentedControl.selectedSegmentIndex = 0
    
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        //MARK: - Download IDs Films
        AF.request(NetworkManager().getTopFilms).responseDecodable(of:TrendingMoviesJSONModel.self) {
            [weak self] data in
            guard let self = self else { return }
            guard let result = data.value?.results else { return }
            
            print("fiiiiiiiiilm")
            print("")
            
            for id in result  {
                self.filmsId.append(id.id ?? 111111)
            }
            for index in self.filmsId {
                self.getFilm(id: index)
            }
        }
        
        //MARK: - Download IDs Series
        AF.request(NetworkManager().getTopTvSeries).responseDecodable(of:TrendingTvSeriesJSONModel.self) { [weak self] data in
            
            guard let self = self else { return }
            print("tvvvvvvvvvvvvvvvvvvv")
            guard let result = data.value?.results else { return }
            print("twwwwwwwwwwwwww")
            print("")
           
            for id in result {
                self.tvSeriesId.append(id.id ?? 11111)
            }
            for index in self.tvSeriesId {
                self.getTvSeries(id: index)
                print("start downloadtvseries ")
                print("")
            }
        }
    }
    
    
    //MARK: - SegmentedControl Action
    @IBAction func changeCategoryOfMediaAction(_ sender: UISegmentedControl) {
        
        searchBar.text = ""
        searchStart = false
        tableView.reloadData()
    }
    
    //MARK: - Function AF request
    func getFilm (id index:Int){
        AF.request(NetworkManager().getMovieURL(with: index)).responseDecodable(of:MovieJSONModel.self) { [weak self] data in
            guard let self = self else { return }
            if let movie = data.value {
                self.filmsArray.append(movie)
            } else { print("someProblem") }
            self.tableView.reloadData()
        }
    }
    
    func getTvSeries(id index:Int) {
        AF.request(NetworkManager().getTvSeriesURL(with: index)).responseDecodable(of:TvSeriesJSONModel.self) {[weak self] data in
            guard let self = self else { return }
            if let tvSeries = data.value {
                self.tvSeriesArray.append(tvSeries)
            } else { print("someProblem") }
            self.tableView.reloadData()
        }
    }
}


// MARK: - TableView
extension MainViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchStart == false {
            switch categorySegmentedControl.selectedSegmentIndex {
            case 0:
                return filmsArray.count
            case 1:
                return tvSeriesArray.count
            default:
                return 100
            }
        } else {
            switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            return searchFilms.count
        case 1:
            return searchTvSeries.count
        default:
            return 100
        }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        
        if searchStart == false {
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
            
        } else {
            
            switch categorySegmentedControl.selectedSegmentIndex {
            case 0:
                cell.configureCell(result: searchFilms[indexPath.row])
                return cell
            case 1:
                cell.configureCell(result: searchTvSeries[indexPath.row])
                return cell
            default:
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else { return }
        
        if searchStart == false {
            switch categorySegmentedControl.selectedSegmentIndex {
            case 0:
                detailViewController.configureDetail (result: filmsArray[indexPath.row])
                navigationController?.pushViewController(detailViewController, animated: true)
            case 1:
                detailViewController.configureDetail(result: tvSeriesArray[indexPath.row])
                navigationController?.pushViewController(detailViewController, animated: true)
            default: break
            }
            
        } else {
            switch categorySegmentedControl.selectedSegmentIndex {
            case 0:
                detailViewController.configureDetail (result: searchFilms[indexPath.row])
                navigationController?.pushViewController(detailViewController, animated: true)
            case 1:
                detailViewController.configureDetail(result: searchTvSeries[indexPath.row])
                navigationController?.pushViewController(detailViewController, animated: true)
            default: break
                
            }
        }
    }
    
}

//MARK: - SearchBar
extension MainViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //        if searchText != "" {
        //            searchStart = true
        //            switch categorySegmentedControl.selectedSegmentIndex {
        //            case 0:
        //                //Movie
        //                searchFilms = []
        //                searchFilmsId = []
        //                AF.request(NetworkManager().searchMovie(name: searchText)).responseDecodable(of:SearchMovieJSONModel.self) { [weak self] data in
        //                    guard let self = self else { return }
        //                    guard let result = data.value?.results else { return }
        //                    for id in result {
        //                        self.searchFilmsId.append(id.id ?? 000000)
        //                    }
        //                    for index in self.searchFilmsId {
        //                        AF.request(NetworkManager().getMovieURL(with: index)).responseDecodable(of:MovieJSONModel.self) {[weak self] data in
        //                            guard let self = self else { return }
        //                            if let movie = data.value {
        //                                self.searchFilms.append(movie)
        //                            } else { print("someProblem") }
        //                            self.tableView.reloadData()
        //                        }
        //                    }
        //                }
        //            case 1:
        //                //TvSeries
        //                searchTvSeries = []
        //                searchTvSeriesId = []
        //                AF.request(NetworkManager().searchTvSeries(name: searchText)).responseDecodable(of:SearchTvSeriesJSONModel.self) { [weak self] data in
        //                    guard let self = self else { return }
        //                    guard let result = data.value?.results else { return }
        //                    for id in result {
        //                        self.searchTvSeriesId.append(id.id ?? 000000)
        //                        print("\(NetworkManager().searchTvSeries(name: searchText))")
        //                    }
        //                    for index in self.searchTvSeriesId {
        //                        AF.request(NetworkManager().getTvSeriesURL(with: index)).responseDecodable(of:TvSeriesJSONModel.self) {[weak self] data in
        //                            guard let self = self else { return }
        //                            if let tvSeries = data.value {
        //                                self.searchTvSeries.append(tvSeries)
        //                            } else { print("someProblem") }
        //                            self.tableView.reloadData()
        //                        }
        //                    }
        //                }
        //            default: return
        //
        //            }
        //        } else { searchStart = false }
        //
        //
        //
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard searchBar.text != "" else {
            searchStart = false
            tableView.reloadData()
            return
        }
        guard let searchName = searchBar.text else {
            searchStart = false
            tableView.reloadData()
            return
        }
        
        searchStart = true
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            //Movie
            searchFilms = []
            searchFilmsId = []
            AF.request(NetworkManager().searchMovie(name: searchName)).responseDecodable(of:SearchMovieJSONModel.self) { [weak self] data in
                guard let self = self else { return }
                guard let result = data.value?.results else { return }
                for id in result {
                    self.searchFilmsId.append(id.id ?? 000000)
                }
                for index in self.searchFilmsId {
                    AF.request(NetworkManager().getMovieURL(with: index)).responseDecodable(of:MovieJSONModel.self) {[weak self] data in
                        guard let self = self else { return }
                        if let movie = data.value {
                            self.searchFilms.append(movie)
                        } else { print("someProblem") }
                        self.tableView.reloadData()
                    }
                }
            }
        case 1:
            //TvSeries
            searchTvSeries = []
            searchTvSeriesId = []
            AF.request(NetworkManager().searchTvSeries(name: searchName)).responseDecodable(of:SearchTvSeriesJSONModel.self) { [weak self] data in
                guard let self = self else { return }
                guard let result = data.value?.results else { return }
                for id in result {
                    self.searchTvSeriesId.append(id.id ?? 000000)

                }
                for index in self.searchTvSeriesId {
                    AF.request(NetworkManager().getTvSeriesURL(with: index)).responseDecodable(of:TvSeriesJSONModel.self) {[weak self] data in
                        guard let self = self else { return }
                        if let tvSeries = data.value {
                            self.searchTvSeries.append(tvSeries)
                        } else { print("someProblem") }
                        self.tableView.reloadData()
                    }
                }
            }
        default: return
            
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchStart = false
        tableView.reloadData()
        print("cancel")
    }
}
