//
//  DataManager.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 07.02.2023.
//

import Foundation

class DataManager {
    
    private var userDefaults = UserDefaults()
    
    static var movieArray: [MovieJSONModel] = []
    static var tvArray: [TvSeriesJSONModel] = []
    
    var delegate:DataManagerDelegate?
    
    func saveFilmDataInManger(){
        guard let movie = delegate?.saveDataMovie() else{return}
        DataManager.movieArray.append(movie)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(DataManager.movieArray)
            userDefaults.set(data, forKey: "Movies")
            print("Save movie - ok!")
        } catch  {
            print("Error save = \(error)")
        }
    }
    
    func saveTvDataInManger(){
        guard let tv = delegate?.saveDataTv() else{return}
        DataManager.tvArray.append(tv)
    
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(DataManager.tvArray)
            userDefaults.set(data, forKey: "TVSeries")
            print("Save TVSeries - ok!")
        } catch  {
            print("Error save = \(error)")
        }
    }
    
    //MARK: - Export media from UserDefaults
    func exportDataFromManager() {
        if let data = userDefaults.data(forKey: "Movies") {
            do {
                let decoder = JSONDecoder()
                let movie:[MovieJSONModel] = try decoder.decode([MovieJSONModel].self, from: data)
                print("export film ok ")
                delegate?.exportData(movies: movie)
            } catch  {
                print("Unable to decode movie (\(error) ")
            }
        }
        
        if let data = userDefaults.data(forKey: "TVSeries") {
            do {
                let decoder = JSONDecoder()
                let tvSeries:[TvSeriesJSONModel] = try decoder.decode([TvSeriesJSONModel].self, from: data)
                print("export tv series ok ")
                delegate?.exportData(movies: tvSeries)
            } catch  {
                print("Unable to decode movie (\(error) ")
            }
        }
    }
}
