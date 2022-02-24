//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/16/22.
//

import Foundation


struct MainWeatherModel: Codable {
    var cod: String
    var message: Float
    var cnt: Float
    var list: [ListModel]
    var city: City
    
}

