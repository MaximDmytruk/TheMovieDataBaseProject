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
    
    
    func configureDetail(result:MovieJSONModel) {
       
        filmObject = result
        
        //MARK: - Set Labels
        self.name = result.title ?? result.originalTitle ?? "Unknow"
        self.year = result.releaseDate ?? "Unknow"
        self.descriptionFilm = result.overview ?? "Unknow"
        
        //MARK: - Set ImageView
        if  let pathOfPoster = result.posterPath {
            self.posterStringPath = NetworkManager().basicImageURL + pathOfPoster
        }
        
        //MARK: - Set BackDropImageView
        if let backDropPath = result.backdropPath {
            self.backdropStringPath = NetworkManager().basicImageURL + backDropPath
        }
        
    }
    
    func configureDetail(result:TvSeriesJSONModel) {
        
        tvSeriaObject = result
       
        //MARK: - Set Labels
        self.name = result.name ?? result.originalName ?? "Unknow"
        self.year = result.firstAirDate ?? "Unknow"
        self.descriptionFilm = result.overview ?? "Unknow"
        
        //MARK: - Set ImageView
        if  let pathOfPoster = result.posterPath {
            self.posterStringPath = NetworkManager().basicImageURL + pathOfPoster
        }
        
        //MARK: - Set BackDropImageView
        if let backDropPath = result.backdropPath {
            self.backdropStringPath = NetworkManager().basicImageURL + backDropPath
        }

    }
    
}


extension DetailsViewController:DataManagerDelegate {
    
    func saveDataMovie() -> MovieJSONModel? {
        return filmObject!
    }
    func saveDataTv() -> TvSeriesJSONModel? {
        return tvSeriaObject!
    }
    func exportData(movies:[Any]) {
        
    }
}

    
    
