//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/16/22.
//

import Foundation


struct WeatherModel: Codable {
    var cod: String
    var message: Float
    var cnt: Float
    var list: [listModel]
    var city: listCity
    
}

struct listModel: Codable {
    var dt: TimeInterval
    var date: Date {
        return Date(timeIntervalSince1970: dt)
    }
    var main: mainModel
    var weather: [weatherModel]
    var wind: windModel
    var visibility: Int?
    var pop: Float?
    var dt_txt: String
}

struct mainModel: Codable {
    var temp: Float
    var celsius: Int {
        return Int(round(temp - 273.15))
    }
    var pressure: Float
    var humidity: Int
    var temp_kf: Float

}

struct weatherModel: Codable {
    var main: String
    var description: String
    var icon: String
    
}

struct windModel: Codable {
    
    let speed: Float
    let deg: Float?
    
    enum Direction: String {
        case north = "N"
        case northEast = "NE"
        case east = "E"
        case southEast = "SE"
        case south = "S"
        case southWest = "SW"
        case west = "W"
        case northWest = "NW"
        
        init(deg: Float) {
            if deg < 23 || deg > 337 {
                self = .north
            } else if deg < 68 {
                self = .northEast
            } else if deg < 113 {
                self = .east
            } else if deg < 158 {
                self = .southEast
            } else if deg < 203 {
                self = .south
            } else if deg < 248 {
                self = .southWest
            } else if deg < 293 {
                self = .west
            } else {
                self = .northWest
            }
        }
    }
    
    var direction: String? {
        guard let deg = deg else { return nil }
        return Direction(deg: deg).rawValue
    }
    
}

struct listCity:Codable {
    var name:String
    var country:String

}
