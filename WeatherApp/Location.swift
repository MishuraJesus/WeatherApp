//
//  Location.swift
//  WeatherApp
//
//  Created by MikhailB on 14/05/2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
