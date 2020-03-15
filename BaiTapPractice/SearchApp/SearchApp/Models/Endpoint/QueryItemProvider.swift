//
//  QueryItemProvider.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/14/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
