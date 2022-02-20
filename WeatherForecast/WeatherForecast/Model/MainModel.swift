//
//  mainModel.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/20/22.
//

import Foundation
struct MainModel: Codable {
    var temp: Float
    var celsius: Int {
        return Int(round(temp - 273.15))
    }
    var pressure: Float
    var humidity: Int
    var temp_kf: Float

}
