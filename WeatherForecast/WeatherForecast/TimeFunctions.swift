//
//  TimeFunctions.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/22/22.
//

import Foundation
func getHourForDate(_ date: Date?) -> String {
    guard let inputDate = date else {
        return ""
    }
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    return formatter.string(from: inputDate)
}

func getDayForDate(_ date: Date?) -> String {
    guard let inputDate = date else {
        return ""
    }
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: inputDate)
}
