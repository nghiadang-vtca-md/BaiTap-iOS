//
//  ViewController13.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/28/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController13: UIViewController {
    @IBOutlet weak var tfFirstname: UITextField!
    @IBOutlet weak var tfLastname: UITextField!
    @IBOutlet weak var switchSex: UISwitch!
    @IBOutlet weak var lblShowExperience: UILabel!
    @IBOutlet weak var sliderExperience: UISlider!
    @IBOutlet weak var segmentNumOfCompany: UISegmentedControl!
    @IBOutlet weak var btnSumit: UIButton!
    @IBOutlet weak var pvWaitingForResult: UIProgressView!
    @IBOutlet weak var indicatorWaitingForResult: UIActivityIndicatorView!
    @IBOutlet weak var tvResult: UITextView!
    
    
    @IBAction func btnSubmit_Tapped(_ sender: UIButton) {
        guard tfFirstname.text != nil else {
            return
        }
        guard tfLastname.text != nil else {
            return
        }
        
        let firstName = tfFirstname.text
        let lastName = tfLastname.text
        let sex = switchSex.isOn ? "Male" : "Female"
        let numbOfExperience = sliderExperience.value
        let numOfCompany = segmentNumOfCompany.selectedSegmentIndex + 1
        
        //let result = "\(firstName) \(lastName)\n\(sex), born in \()"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpInitial()
        
    }
    
    func setUpInitial(){
        pvWaitingForResult.isHidden = true
        indicatorWaitingForResult.isHidden = true
        tvResult.isHidden = true
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
