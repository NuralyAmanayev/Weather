//
//  ListCity.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/20/22.
//

import Foundation
struct City: Codable {
    let id: Int
    let name: String
//    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

//struct Coord: Codable {
//    let lat, lon: Double
//}
