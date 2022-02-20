//
//  listModel.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/20/22.
//

import Foundation
struct ListModel: Codable {
    var dt: TimeInterval
    var date: Date {
        return Date(timeIntervalSince1970: dt)
    }
    var main: MainModel
    var weather: [WeatherModel]
    var wind: WindModel
    var visibility: Int?
    var pop: Float?
    var dt_txt: String
}
