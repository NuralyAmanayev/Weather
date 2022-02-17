//
//  NetworkManager.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/16/22.
//

import Foundation




class NetworkManager {
//    var getloc = GetLocation()
    var latitide = GetLocation.latitude
    var longitude = GetLocation.longitude
    
    func requestWeather(result: @escaping ([WeatherModel]) -> ()){//}, latitude: Double, longitude: Double){
        let apiKey = "5308895e59599bce50322cbfd1f66036"
        let url =  "https://api.openweathermap.org/data/2.5/forecast?lat=\(self.latitide)&lon=\(self.longitude)&appid=\(apiKey)"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in

            // validation
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }

            // convert data to models/some object

            var json: WeatherModel?
            do{
                json = try JSONDecoder().decode(WeatherModel.self, from: data)
//                print(json)
                
                
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

            
        
        }).resume()

        
    }
}
