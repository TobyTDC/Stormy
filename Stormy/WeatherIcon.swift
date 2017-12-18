//
//  WeatherIcon.swift
//  Stormy
//
//  Created by toby tang on 2017-12-03.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit


enum WeatherIcon: String {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
    case wind = "wind"
    case fog = "fog"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case `default` //``avoid collision with key word
    
    init(iconString: String){
        switch iconString {
        case "clear-day": self = .clearDay
        case "clear-night": self = .clearNight
        case "rain": self = .rain
        case "snow": self = .snow
        case "sleet": self = .sleet
        case "wind": self = .wind
        case "fog": self = .fog
        case "cloudy": self = .cloudy
        case "partly-cloudy-day": self = .partlyCloudyDay
        case "partly-cloudy-night": self = .partlyCloudyNight
        default: self = .default
        }
    }
}

extension WeatherIcon{
    var image: UIImage {
        switch self{
        case .clearDay: return #imageLiteral(resourceName: "clear-day")
        case .clearNight: return #imageLiteral(resourceName: "clear-night")
        case .rain: return #imageLiteral(resourceName: "rain")
        case .snow: return #imageLiteral(resourceName: "snow")
        case .sleet: return #imageLiteral(resourceName: "sleet")
        case .wind: return #imageLiteral(resourceName: "wind")
        case .fog: return #imageLiteral(resourceName: "fog")
        case .cloudy: return #imageLiteral(resourceName: "cloudy")
        case .partlyCloudyDay: return #imageLiteral(resourceName: "partly-cloudy-night")
        case .partlyCloudyNight: return #imageLiteral(resourceName: "partly-cloudy-night")
        case .default: return #imageLiteral(resourceName: "default")
        }
    }
}

