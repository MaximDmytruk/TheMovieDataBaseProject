//
//  NetworkManger.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 04.02.2023.
//

import Foundation
import Alamofire
import SDWebImage

class NetworkManager {
   // var page = 1
    var getTopFilms = "https://api.themoviedb.org/3/trending/movie/week?api_key=13f1bec158d9c8153c2b699180bc1fba"
    var getTopTvSeries = "https://api.themoviedb.org/3/trending/tv/week?api_key=13f1bec158d9c8153c2b699180bc1fba"
    var basicImageURL = "https://image.tmdb.org/t/p/original/"
    
    func getMovieURL(with id:Int) -> String {
        let URL = "https://api.themoviedb.org/3/movie/\(id)?api_key=13f1bec158d9c8153c2b699180bc1fba"
        
        return URL
    }
    
    func getTvSeriesURL(with id:Int) -> String {
        let URL =  "https://api.themoviedb.org/3/tv/\(id)?api_key=13f1bec158d9c8153c2b699180bc1fba&language=en-US"
        return URL
    }
    
    func searchTvSeries(name:String) -> String{
        var newName = ""
        for char in name {
            if char == " "{
                newName.append("%")
            } else { newName.append(char)}
        }
        let searchURL =  "https://api.themoviedb.org/3/search/tv?api_key=13f1bec158d9c8153c2b699180bc1fba&include_adult=false&query=\(newName)"
        return searchURL
    }
    
    func searchMovie(name:String) -> String{
        var newName = ""
        for char in name {
            if char == " "{
                newName.append("%")
            } else { newName.append(char)}
        }
        
        let searchURL = "https://api.themoviedb.org/3/search/movie?api_key=13f1bec158d9c8153c2b699180bc1fba&query=\(newName)&include_adult=false"
     
        return searchURL
        
    }
    
}
