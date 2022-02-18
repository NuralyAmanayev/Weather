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
    var isMoreDataLoading = false
    var indicator = 0
    @IBOutlet weak var CustomTableView: UITableView!
    var loadingMoreView:SpinerView?
//    var list = weatherMo
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingData()
//        networkManager.requestWeather { data in
//            DispatchQueue.main.async { [self] in
//                           self.weatherModel = data
//            }}
//
//        print(weatherModel)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getLocation.setupLocation()
    }

    
    func loadingData(){
        networkManager.requestWeather { data in
            DispatchQueue.main.async {
                [self] in
                self.weatherModel = data
                self.CustomTableView.reloadData()
                
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false){ timer in
                    self.isMoreDataLoading = false
                    self.loadingMoreView?.stopAnimating()
                    if self.indicator == 1{
                        self.CustomTableView.contentInset.top -= SpinerView.defaultHeight
                    } else if self.indicator == 2 {
                        self.CustomTableView.contentInset.bottom -= SpinerView.defaultHeight
                    }
                }
            }
        }
    }
    
    
    
    

}

