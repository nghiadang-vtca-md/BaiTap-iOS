//
//  DarkSkyError.swift
//  WeatherApp
//
//  Created by nghiadang1205 on 3/6/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}
