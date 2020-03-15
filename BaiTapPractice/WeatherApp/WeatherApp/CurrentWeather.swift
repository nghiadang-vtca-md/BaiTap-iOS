//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by nghiadang1205 on 3/6/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

struct CurrentWeather: Codable {
    let temperature: Double
    let humidity: Double
    let precipProbability: Double
    let summary: String
    let icon: String
    
    // sử dụng cho Codable nếu cần custom lại tên biến
    enum CurrentWeatherCodingKeys: String, CodingKey {
        case temperature = "temperature"
        case humidity = "humidity"
        case precipProbability = "precipProbability"
        case summary = "summary"
        case icon = "icon"
    }
}

extension CurrentWeather {
    var iconImage: UIImage {
        switch icon {
        case "clear-day": return #imageLiteral(resourceName: "clear-day")
        case "clear-night": return #imageLiteral(resourceName: "clear-night")
        case "rain": return #imageLiteral(resourceName: "rain")
        case "snow": return #imageLiteral(resourceName: "snow")
        case "sleet": return #imageLiteral(resourceName: "sleet")
        case "wind": return #imageLiteral(resourceName: "wind")
        case "fog": return #imageLiteral(resourceName: "fog")
        case "cloudy": return #imageLiteral(resourceName: "cloudy")
        case "partly-cloudy-day": return #imageLiteral(resourceName: "partly-cloudy-day")
        case "partly-cloudy-night": return #imageLiteral(resourceName: "partly-cloudy-night")
        default: return #imageLiteral(resourceName: "default")
        }
    }
}

// Sử dụng Codable thì không cần này nữa
//extension CurrentWeather {
//    struct Key {
//        static let temperature = "temperature"
//        static let humidity = "humidity"
//        static let precipProbability = "precipProbability"
//        static let summary = "summary"
//        static let icon = "icon"
//    }
//
//    init?(json: [String: AnyObject]) {
//        guard let tempValue = json[Key.temperature] as? Double,
//            let humidityValue = json[Key.humidity] as? Double,
//            let precipitationValue = json[Key.precipProbability] as? Double,
//            let summaryString = json[Key.summary] as? String,
//            let iconString = json[Key.icon] as? String else {
//                return nil
//        }
//
//        self.temperature = tempValue
//        self.humidity = humidityValue
//        self.precipProbability = precipitationValue
//        self.summary = summaryString
//        self.icon = iconString
//
//    }
//}
