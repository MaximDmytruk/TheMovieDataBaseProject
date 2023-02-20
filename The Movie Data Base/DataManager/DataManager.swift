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
    
        //Записали у юзер дату масив movieArray
        do {
            let encoder = JSONEncoder()
            let data = try? encoder.encode(DataManager.movieArray)
            userDefaults.set(data, forKey: "Movies")
            print("Save ok!")
        } catch  {
            print("Error = \(error)")
        }
    }
    
    func saveTvDataInManger(){
    
        guard let tv = delegate?.saveDataTv() else{return}
        DataManager.tvArray.append(tv)
    }
    
    func exportDataFromManager() {
        delegate?.exportData(movies: DataManager.tvArray)
        
        //експортуємо дані з дати 
        guard let data = userDefaults.data(forKey: "Movies") else { return }
        do {
            let decoder = JSONDecoder()
            let movie:[MovieJSONModel] = try decoder.decode([MovieJSONModel].self, from: data)
            print("export ok ")
            delegate?.exportData(movies: movie)
        } catch  {
            print("Unable to decode movie (\(error) ")
        }
        
    }
    
}
