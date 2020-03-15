//
//  ItunesError.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/14/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFail
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure(message: String)
}
