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
//        self.long = currentLocation.coordinate.longitude
//        var lat = first.coordinate.latitude
        manager.stopUpdatingLocation()
    }
    
    
}