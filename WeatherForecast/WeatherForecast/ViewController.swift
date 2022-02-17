//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/16/22.
//

import UIKit
//import CoreLocation

class ViewController: UIViewController{//, CLLocationManagerDelegate{

    var networkManager = NetworkManager()
    var weatherModel = [WeatherModel]()
    var getLocation = GetLocation()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.requestWeather(result: { (_: [WeatherModel]) in
            return
        }, latitude: getLocation.latitude, longitude: getLocation.longitude)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getLocation.setupLocation()
    }

    
}

