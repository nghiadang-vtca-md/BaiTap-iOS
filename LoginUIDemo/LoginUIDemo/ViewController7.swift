//
//  ViewController7.swift
//  LoginUIDemo
//
//  Created by user159518 on 10/23/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController7: UIViewController, UITextFieldDelegate {
    // Properties
    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var tfY: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    // Actions
    @IBAction func btnSubmit_tui(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Options", message: "Choose the operation", preferredStyle: .actionSheet)
        
//        let valueX_String = tfX.text ?? "0"
//        let valueY_String = tfY.text ?? "0"
//
//        let valueX: Int = Int(valueX_String) ?? 0
//        let valueY: Int = Int(valueY_String) ?? 0
        
        
        guard let x = tfX.text, !x.isEmpty else {
            showAlertEmptyField(field: "x")
            return
        }
        guard let y = tfY.text, !y.isEmpty else {
            showAlertEmptyField(field: "y")
            return
        }
        
        let valueX = Int(x) ?? 0
        let valueY = Int(y) ?? 0
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("action cancel")
        }
        
        let actionAdd = UIAlertAction(title: "Add (+)", style: .default) { (_) in
            self.calculateAndShowResultAlert(x: valueX, y: valueY, operate: "+")
            
        }
        let actionMinus = UIAlertAction(title: "Minus (-)", style: .default) { (_) in
            self.calculateAndShowResultAlert(x: valueX, y: valueY, operate: "-")
        }
        let actionMultiply = UIAlertAction(title: "Multiply (*)", style: .default) { (_) in
            self.calculateAndShowResultAlert(x: valueX, y: valueY, operate: "*")
        }
        let actionDivide = UIAlertAction(title: "Divide (/)", style: .default) { (_) in
            self.calculateAndShowResultAlert(x: valueX, y: valueY, operate: "/")
        }
        
        let actionReEnter = UIAlertAction(title: "Re-enter", style: .destructive) { (_) in
            print("Re-enter")
        }
        
        alertController.addAction(actionCancel)
        alertController.addAction(actionAdd)
        alertController.addAction(actionMinus)
        alertController.addAction(actionMultiply)
        alertController.addAction(actionDivide)
        alertController.addAction(actionReEnter)
        
        self.present(alertController, animated: true, completion: nil)
        
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == tfX {
                tfY.becomeFirstResponder()
            } else if textField == tfY {
                self.view.endEditing(true)
            }
            return true
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlertEmptyField(field: String){
        let alertStyle = UIAlertController(title: "Error", message: "\(field) is empty!", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .default) { (_) in
            print("action OK")
        }
        alertStyle.addAction(actionOk)
        self.present(alertStyle, animated: true, completion: nil)
    }
    
    func calculateAndShowResultAlert(x: Int, y: Int, operate: String){
        var result: String
        switch operate {
        case "+":
            result = String(x + y)
        case "-":
            result = String(x - y)
        case "*":
            result = String(x * y)
        case "/":
            result = x == 0 || y == 0 ? "0" : String(x / y)
        default:
            return
        }
        
        let alertStyle = UIAlertController(title: "Result", message: "\(x) \(operate) \(y) = \(result)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { (_) in
            print("action Ok")
        }
        alertStyle.addAction(actionOk)
        self.present(alertStyle, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
