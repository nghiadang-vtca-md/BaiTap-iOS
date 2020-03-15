//
//  Weather.swift
//  WeatherApp
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let currently: CurrentWeather
}

// Sử dụng Codable thì không dùng này nữa
//extension Weather {
//    init?(json: [String: AnyObject]) {
//        guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
//            return nil
//
//        }
//        self.currently = currentWeather
//    }
//}
