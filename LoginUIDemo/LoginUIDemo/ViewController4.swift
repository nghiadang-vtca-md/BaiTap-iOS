//
//  ViewController4.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/21/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    // Properties
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var btnCalculate: UIButton!
    @IBOutlet weak var lblResultBMI: UILabel!
    // Actions
    
    @IBAction func btnCalculate_click(_ sender: UIButton) {
//        tfHeight.resignFirstResponder()
        self.view.endEditing(true)
        
        // nếu giá trị trước nó là nil thì trả về giá trị mặc định
        let heightText = tfHeight.text ?? "0"
        let weightText = tfWeight.text ?? "0"
        // ?? cũng là 1 dạng un-wrap
        let heightValue = Double(heightText) ?? 0
        let weightValue = Double(weightText) ?? 0
        
        var result = 0.0
        if heightValue != 0 && weightValue != 0 {
            result = (weightValue / heightValue / heightValue) * 10000.0
        }
        
        lblResultBMI.isHidden = false
        lblResultBMI.text = "BMI: \(result)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // kĩ thuật delegate
        // c1: sử dụng code
        tfWeight.delegate = self
        tfHeight.delegate = self
        // c2: chuột phải vào textfield -> kéo delegate sang trái vào ViewController cần delegate
        
        lblResultBMI.isHidden = true
    }
    
    
    
    
    /*
     kĩ thuật delegate for UITextFielđelegate
     
     */
    
    // có 2 cách hạ keyboard
    // c1: myTF.resignFirstResponder()
    // c2: self.view.endEditing(true)
    
    // Xem thêm func của protocol UITextFieldDelegate

}

extension ViewController4: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfWeight {
            tfHeight.becomeFirstResponder()
        } else if textField == tfHeight {
            self.view.endEditing(true)
        }
        return true
    }
}
