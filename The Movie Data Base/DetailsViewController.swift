//
//  DetailsViewController.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 03.02.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleFilm: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name = ""
    var year = ""
    var descriptionFilm = ""
    
    var posterStringPath = ""
    var backdropStringPath = ""
    
    var filmObject:MovieJSONModel? = nil
    var tvSeriaObject:TvSeriesJSONModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImage.layer.cornerRadius = 5
        
        self.titleFilm.text = name
        self.yearLabel.text = year
        self.descriptionLabel.text = descriptionFilm
        
        self.posterImage.sd_setImage(with: URL(string: posterStringPath))
        self.backdropImageView.sd_setImage(with: URL(string: backdropStringPath))
    }
    
    //MARK: Button "Save" pressed
    @IBAction func savePressed(_ sender: Any) {
        if filmObject != nil {
            let dataBase = DataManager()
            dataBase.delegate = self
            dataBase.saveFilmDataInManger()
        } else {
            let dataBase = DataManager()
            dataBase.delegate = self
            dataBase.saveTvDataInManger()
        }
    }
    
    //MARK: - Config the cell
    func configureDetail(result:Any) {
        if let object = result as? MovieJSONModel {
            
            filmObject = object
            
            /// - Set Labels
            self.name = object.title ?? object.originalTitle ?? "Unknow"
            self.year = object.releaseDate ?? "Unknow"
            self.descriptionFilm = object.overview ?? "Unknow"
            
            /// - Set ImageView
            if  let pathOfPoster = object.posterPath {
                self.posterStringPath = NetworkManager().basicImageURL + pathOfPoster
            }
            
            /// - Set BackDropImageView
            if let backDropPath = object.backdropPath {
                self.backdropStringPath = NetworkManager().basicImageURL + backDropPath
            }
            
        } else if let object = result as? TvSeriesJSONModel {
            
            tvSeriaObject = object
            
           /// - Set Labels
            self.name = object.name ?? object.originalName ?? "Unknow"
            self.year = object.firstAirDate ?? "Unknow"
            self.descriptionFilm = object.overview ?? "Unknow"
            
            /// - Set ImageView
            if  let pathOfPoster = object.posterPath {
                self.posterStringPath = NetworkManager().basicImageURL + pathOfPoster
            }
            
            /// - Set BackDropImageView
            if let backDropPath = object.backdropPath {
                self.backdropStringPath = NetworkManager().basicImageURL + backDropPath
            }
        }
    }
}

extension DetailsViewController:DataManagerDelegate {
    func saveDataMovie() -> MovieJSONModel? { return filmObject! }
    func saveDataTv() -> TvSeriesJSONModel? { return tvSeriaObject! }
    func exportData(movies:[Any]) {}
}



