//
//  Coordinate.swift
//  WeatherApp
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var alcatrazIsland: Coordinate {
        return Coordinate(latitude: 37.8267, longitude: -122.4233)
    }
}
