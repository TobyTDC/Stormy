//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by toby tang on 2017-12-03.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature:  String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather){
        let roundedTemperature = Int(model.temperature)
        self.temperature="\(roundedTemperature)º"
        
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity="\(humidityPercentValue)%"
        
        let precipPersentValue = Int(model.precipitationProbability * 100)
        self.precipitationProbability="\(precipPersentValue)%"
        
        self.summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.image
    }
}

