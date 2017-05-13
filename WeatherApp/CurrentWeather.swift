//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by MikhailB on 12/05/2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemperature: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        return _currentTemperature
    }
    
    func downloadWeatherDeatails(completed: @escaping DownloadComplete) {
        
        //Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                //Get city name
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                //Get current weather type
                if let weather = dict["weather"] as? Array<Dictionary<String, AnyObject>> {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                //Get current temperature
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double? {
                        let tempInCelsius = Double(round(temp! - 273.15))
                        self._currentTemperature = tempInCelsius
                    }
                }
            }
            completed()
        }
    }
}

