//
//  Forecast.swift
//  WeatherApp
//
//  Created by MikhailB on 13/05/2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weather: String!
    var _highTemperature: String!
    var _lowTemperature: String!
        
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    var weather: String {
        if _weather == nil {
            _weather = ""
        }
        return _weather
    }
    var highTemperature: String {
        if _highTemperature == nil {
            _highTemperature = ""
        }
        return _highTemperature
    }
    var lowTemperature: String {
        if _lowTemperature == nil {
            _lowTemperature = ""
        }
        return _lowTemperature
    }
    
    
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                self._lowTemperature = "\(Double(round(min - 273.15)))"
            }
            if let max = temp["max"] as? Double {
                self._highTemperature = "\(Double(round(max - 273.15)))"
            }
        }
        if let weather = weatherDict["weather"] as? Array<Dictionary<String, AnyObject>> {
            if let main = weather[0]["main"] as? String {
                self._weather = main.capitalized
            }
        }
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}









