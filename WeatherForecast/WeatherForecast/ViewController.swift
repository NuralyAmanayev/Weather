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
//    var list = weatherMo
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.requestWeather { data in
            DispatchQueue.main.async { [self] in
                           self.weatherModel = data
            }}
        
        print(weatherModel)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getLocation.setupLocation()
    }


}

