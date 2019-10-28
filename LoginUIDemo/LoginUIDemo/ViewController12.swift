//
//  ViewController12.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/28/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController12: UIViewController {
    // For StepControl
    @IBOutlet weak var lblShowNumber: UILabel!
    @IBOutlet weak var myStepControl: UIStepper!
    
    @IBAction func stepControl_ValueChanged(_ sender: UIStepper) {
        lblShowNumber.text = String(Int(sender.value))
    }
    // End
    
    // For SegmentControl

    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    
    var newPosition = 3
    @IBAction func mySegmentControl_ValueChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        if sender.selectedSegmentIndex == newPosition - 1 {
            sender.insertSegment(withTitle: String(newPosition + 1), at: newPosition, animated: true)
            newPosition += 1
        }
    }
    
    // End
    
    // For SwitchControl
    @IBAction func mySwitchControl(_ sender: UISwitch) {
        if !sender.isOn {
//            self.newPosition = 3
//            mySegmentControl
        }
        print(sender.isOn)
    }
    
    // End
    
    // For Activity Indicator View
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    
    
    @IBAction func action_start_stop(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start" {
            myIndicator.startAnimating()
            isStartSelected(bool: true)
            
        } else {
            myIndicator.stopAnimating()
            isStartSelected(bool: false)
        }
    }
    
    func isStartSelected(bool: Bool) {
        if bool {
            btnStart.alpha = 0.3
            btnStart.isEnabled = false
            btnStop.alpha = 1
            btnStop.isEnabled = true
        } else {
            btnStop.alpha = 0.3
            btnStop.isEnabled = false
            btnStart.alpha = 1
            btnStart.isEnabled = true
        }
    }
    // End
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // For stepControl
        myStepControl.setDividerImage(UIImage(named: "sunMax.png"), forLeftSegmentState: .normal, rightSegmentState: .normal)
        // End
        
        // 4 cach chon mau bang code
        lblShowNumber.textColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        lblShowNumber.textColor = .blue
        lblShowNumber.textColor = UIColor.blue
        lblShowNumber.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        // end 4 cach
        
        // For Activity Indicator View
        isStartSelected(bool: false)
        // End
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
