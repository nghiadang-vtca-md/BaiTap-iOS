//
//  TipCalcViewModel.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

class TipCalcViewModel {
    func calculateTip(tip: Tip) -> (Double, Double) {
        let tipAmt = tip.totalAmount * tip.tipPercentage/100.0
        let newTotal = tipAmt + tip.totalAmount
        return (tipAmt/tip.numberOfPeople, newTotal/tip.numberOfPeople)
    }
}
