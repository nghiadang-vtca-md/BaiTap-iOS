//
//  SimpleListViewModel.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

class SimpleListViewModel {
    private var simpleModels: [SimpleModel]
    
    var count: Int {
        return simpleModels.count
    }
    
    init() {
        simpleModels = [
            SimpleModel(text: "Orange", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),
            SimpleModel(text: "Blue", color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)),
            SimpleModel(text: "Green", color: #colorLiteral(red: 0, green: 0.7824953198, blue: 0.4556441307, alpha: 1)),
            SimpleModel(text: "Purple", color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),
            SimpleModel(text: "Cyan", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        ]
    }
    
    func getModelAt(_ index: Int) -> SimpleModel {
        return simpleModels[index]
    }
}
