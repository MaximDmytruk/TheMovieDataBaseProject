//
//  DataManagerDelegate.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 07.02.2023.
//

import Foundation

protocol DataManagerDelegate:AnyObject {

    func saveDataMovie()->MovieJSONModel?
    func saveDataTv()->TvSeriesJSONModel?
    func exportData(movies:[Any]) 

    
}
