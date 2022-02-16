//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/16/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    var manager: CLLocationManager?
    var networkManager = NetworkManager()
    var weatherModel = [WeatherModel]()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

