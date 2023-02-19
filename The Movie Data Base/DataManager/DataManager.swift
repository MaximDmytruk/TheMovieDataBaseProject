//
//  DataManager.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 07.02.2023.
//

import Foundation

class DataManager {
    
    var userDefaults = UserDefaults()
    static var movieArray: [MovieJSONModel] = []
    static var tvArray: [TvSeriesJSONModel] = []
    
    var delegate:DataManagerDelegate?
    
    func saveFilmDataInManger(){
    
        guard let movie = delegate?.saveDataMovie() else{return}
        DataManager.movieArray.append(movie)
    
//        do {
//            let encoder = JSONEncoder()
//            //var arrayMovie = DataManager.movieArray
//            let data = try? encoder.encode(DataManager.movieArray)
//            userDefaults.set(data, forKey: "Movies")
//            print("Save ok!")
//        } catch  {
//            print("Error = \(error)")
//        }
    }
    func saveTvDataInManger(){
    
        guard let tv = delegate?.saveDataTv() else{return}
        DataManager.tvArray.append(tv)
    }
    
    func exportDataFromManager() {
        delegate?.exportData(movies: DataManager.tvArray)
        delegate?.exportData(movies: DataManager.movieArray)
       
    }
    
}
