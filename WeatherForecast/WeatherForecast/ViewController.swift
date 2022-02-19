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
//    var loadingMoreView:SpinerView?
    var loadingMoreView = SpinerView()
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
        
//        loadingMoreView.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
        loadingMoreView.translatesAutoresizingMaskIntoConstraints = false
        loadingMoreView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loadingMoreView.heightAnchor.constraint(equalToConstant: 80).isActive = true
                view.addSubview(loadingMoreView)
        loadingMoreView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loadingMoreView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        networkManager.requestWeather { data in
            
            DispatchQueue.main.async {
//                [self] in
                self.loadingMoreView.startAnimating()
                self.weatherModel = data
                self.CustomTableView.reloadData()
                
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false){ timer in
                    self.isMoreDataLoading = false
                    self.loadingMoreView.stopAnimating()
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

