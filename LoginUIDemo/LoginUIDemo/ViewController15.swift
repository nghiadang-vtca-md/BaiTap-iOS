//
//  ViewController15.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/30/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController15: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var datePickerDynamic = UIDatePicker(frame: CGRect(x: 10, y: 500, width: 300, height: 400))
        datePickerDynamic.datePickerMode = .date
        datePickerDynamic.locale = .current
        datePickerDynamic.date = Date()
        datePickerDynamic.addTarget(self, action: #selector(dpt_action_ValueChanged), for: .valueChanged)
        
        self.view.addSubview(datePickerDynamic)
        
    }
    @objc func dpt_action_ValueChanged(sender: UIDatePicker!) {
        print(sender.date)
    }

    @IBAction func dtp_ValueChanged(_ sender: UIDatePicker) {
        let date = sender.date
        print(date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let dateStr = formatter.string(from: date)
        print(dateStr)
        
        let strToDate = formatter.date(from: "12-05-1996")
        print(strToDate)
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
