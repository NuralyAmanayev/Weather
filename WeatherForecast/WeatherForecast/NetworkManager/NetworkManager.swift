//
//  NetworkManager.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/16/22.
//

import Foundation




class NetworkManager {
//    var getloc = GetLocation()
//    var latitide = GetLocation.latitude
//    var longitude = GetLocation.longitude
//    var lat = GetLocation.shared.latitude
//    var longi = GetLocation.shared.longitude
    
    func requestWeather(result: @escaping ([MainWeatherModel]) -> ()){//}, latitude: Double, longitude: Double){
        let apiKey = "5308895e59599bce50322cbfd1f66036"
        print("\(GetLocation.shared.latitude)|||\(GetLocation.shared.longitude)")
        let url =  "https://api.openweathermap.org/data/2.5/forecast?lat=\(GetLocation.shared.latitude)&lon=\(GetLocation.shared.longitude)&appid=\(apiKey)"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in

            // validation
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }

            // convert data to models/some object

            var json: MainWeatherModel?
            do{
                json = try JSONDecoder().decode(MainWeatherModel.self, from: data)
                print(json)
                
                
                guard let result1 = json else{
                    return
                }
                DispatchQueue.main.async {
                    result([result1])
                                }
                print(result)
            }
            
            
            catch{
                print("error: \(error)")
            }

//            guard let result = json else{
//                return
//            }
            print("\(GetLocation.shared.latitude)|||\(GetLocation.shared.longitude)")
            
        
        }).resume()

        
    }
}
