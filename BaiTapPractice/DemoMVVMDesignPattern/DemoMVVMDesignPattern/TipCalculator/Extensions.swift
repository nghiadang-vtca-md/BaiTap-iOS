//
//  Extension.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

extension Double {
    var toString: String {
        return String.init(format: "%0.2f", self)
    }
}

extension String {
    var toDouble: Double? {
        return Double(self)
    }
}
