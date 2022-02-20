//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/16/22.
//

import UIKit
//import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //, CLLocationManagerDelegate{

    var networkManager = NetworkManager()
    var mainWeatherModel = [MainWeatherModel]()
    var list = [ListModel]()
    var getLocation = GetLocation()
    var isMoreDataLoading = false
    var indicator = 0
    @IBOutlet weak var CustomTableView: UITableView!
    var loadingMoreView = SpinerView()

    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingData()
        CustomTableView.delegate = self
        CustomTableView.dataSource = self
//        print(mainWeatherModel.count)


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getLocation.setupLocation()
    }

    
    func loadingData(){
        

        loadingMoreView.translatesAutoresizingMaskIntoConstraints = false
        loadingMoreView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loadingMoreView.heightAnchor.constraint(equalToConstant: 80).isActive = true
                view.addSubview(loadingMoreView)
        loadingMoreView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loadingMoreView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        networkManager.requestWeather { data in
            
            DispatchQueue.main.async {
                self.loadingMoreView.startAnimating()
                self.mainWeatherModel = data
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainWeatherModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customCell = CustomTableView.dequeueReusableCell(withIdentifier: "CustomCell") as! TableViewCell
        var mainWeatherModelArray = mainWeatherModel[indexPath.row]
        customCell.JobLable.text = mainWeatherModel[0].list[0].dt_txt
        return customCell
    }
                
    
    
    
    
    

}

