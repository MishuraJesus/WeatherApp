//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by MikhailB on 14/05/2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemperature: UILabel!
    @IBOutlet weak var lowTemperature: UILabel!
        
    func configureCell(forecast: Forecast) {
        lowTemperature.text = "\(forecast.lowTemperature)"
        highTemperature.text = "\(forecast.highTemperature)"
        weatherType.text = forecast.weather
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weather)
    }

    

}
