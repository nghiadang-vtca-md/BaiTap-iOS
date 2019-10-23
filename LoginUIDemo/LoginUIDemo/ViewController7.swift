//
//  ViewController7.swift
//  LoginUIDemo
//
//  Created by user159518 on 10/23/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController7: UIViewController {
    // Properties
    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var tfY: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    // Actions
    @IBAction func btnSubmit_tui(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Options", message: "Choose the operation", preferredStyle: .actionSheet)
        
        
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("action cancel")
        }
        
        let actionAdd = UIAlertAction(title: "Add (+)", style: .default) { (_) in
            print("+")
            let alertStyle = UIAlertController(title: "Result", message: "a + b = ab", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default) { (_) in
                print("action Ok")
            }
            alertStyle.addAction(actionOk)
            self.present(alertStyle, animated: true, completion: nil)
            
        }
        let actionMinus = UIAlertAction(title: "Minus (-)", style: .default) { (_) in
            print("-")
        }
        let actionMultiply = UIAlertAction(title: "Multiply (*)", style: .default) { (_) in
            print("*")
        }
        let actionDivide = UIAlertAction(title: "Divide (/)", style: .default) { (_) in
            print("/")
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
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
