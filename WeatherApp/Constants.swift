//
//  Constants.swift
//  WeatherApp
//
//  Created by MikhailB on 12/05/2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "c339f6cb845133d0a654f35f8b81e151"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)56\(LONGITUDE)73\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=37&lon=139&cnt=10&appid=c339f6cb845133d0a654f35f8b81e151"
