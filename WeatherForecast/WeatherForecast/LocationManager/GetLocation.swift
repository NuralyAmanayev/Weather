//
//  GetLocation.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/17/22.
//

import Foundation
import CoreLocation

class GetLocation:NSObject, CLLocationManagerDelegate {
    
    var manager: CLLocationManager?
    static var latitude: Double = 0.0
    static var longitude: Double = 0.0
    func setupLocation(){
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else {
            return
        }
        print("\(currentLocation.coordinate.longitude)|\(currentLocation.coordinate.latitude)")
        GetLocation.longitude = currentLocation.coordinate.longitude
        GetLocation.latitude = currentLocation.coordinate.latitude
        manager.stopUpdatingLocation()
    }
    
    
}
