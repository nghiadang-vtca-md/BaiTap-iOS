//
//  TipCalcViewController.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class TipCalcViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var numberOfPeople: UITextField!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    @IBOutlet weak var newTotalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    var viewModel = TipCalcViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        newTotalLabel.text = ""
        tipAmountLabel.text = ""
        
        totalAmount.keyboardType = .decimalPad
        numberOfPeople.keyboardType = .numberPad
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnScreen(_:)))
        
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    @objc func didTapOnScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
        guard let totalAmount = totalAmount.text, !totalAmount.isEmpty, let numberOfPeople = numberOfPeople.text, !numberOfPeople.isEmpty else {
            newTotalLabel.text = ""
            tipAmountLabel.text = ""
            return
        }
        
        let total = totalAmount.toDouble ?? 0.0
        let percentage = tipPercent.titleForSegment(at: tipPercent.selectedSegmentIndex)?.toDouble ?? 0.0
        let people = numberOfPeople.toDouble ?? 1.0
        
        let tipModel = Tip(totalAmount: total, tipPercentage: percentage, numberOfPeople: people)
        let (tipAmount, newTotal) = viewModel.calculateTip(tip: tipModel)
        
        newTotalLabel.text = "Total amount: \(newTotal)" + (tipModel.numberOfPeople > 1.0 ? " per person" : "")
        tipAmountLabel.text = "Tip amount: \(tipAmount)" + (tipModel.numberOfPeople > 1.0 ? " per person" : "")
    }
    

    

}
