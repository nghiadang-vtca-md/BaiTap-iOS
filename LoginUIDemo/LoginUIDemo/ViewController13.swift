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
    @IBOutlet weak var stepperAge: UIStepper!
    @IBOutlet weak var lblShowAge: UILabel!
    @IBOutlet weak var lblShowExperience: UILabel!
    @IBOutlet weak var sliderExperience: UISlider!
    @IBOutlet weak var segmentNumOfCompany: UISegmentedControl!
    @IBOutlet weak var btnSumit: UIButton!
    @IBOutlet weak var pvWaitingForResult: UIProgressView!
    @IBOutlet weak var indicatorWaitingForResult: UIActivityIndicatorView!
    @IBOutlet weak var tvResult: UITextView!
    
    @IBAction func stepperAge_Changed(_ sender: UIStepper) {
        lblShowAge.text = "\(Int(stepperAge.value))"
    }
    
    @IBAction func sliderExperience_Changed(_ sender: UISlider) {
        lblShowExperience.text = "\(Int(sliderExperience.value))"
    }
    
    var timer: Timer!
    
    @IBAction func btnSubmit_Tapped(_ sender: UIButton) {
        
        self.view.endEditing(true)
        
        let firstName = tfFirstname.text ?? ""
        let lastName = tfLastname.text ?? ""
        
        guard !firstName.isEmpty else {
            showErrorEmpty(fieldName: "First name")
            return
        }
        guard !lastName.isEmpty else {
            showErrorEmpty(fieldName: "Last name")
            return
        }
        
        let sex = switchSex.isOn ? "Male" : "Female"
        let age = Int(stepperAge.value)
        let numbOfExperience = Int(sliderExperience.value)
        let numOfCompany = segmentNumOfCompany.selectedSegmentIndex + 1
        
        let result = "\(firstName) \(lastName)\n\(sex), born in \(Calendar.current.component(.year ,from: Date()) - age)\nNum of experience: \(numbOfExperience)\nNum of company: \(numOfCompany)"
        
        
        showWaiting10Seconds(result: result)
        
    }
    
    func showWaiting10Seconds(result: String) {
//        indicatorWaitingForResult.isHidden = false
//        indicatorWaitingForResult.isAnimating = true
        pvWaitingForResult.isHidden = false
//        pvWaitingForResult.progress = 0.0
        indicatorWaitingForResult.startAnimating()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self](_) in
            
            guard let wSelf = self else { return }
            
            let progressUpdate = wSelf.pvWaitingForResult.progress + 0.1 // không được làm vậy !!!
            wSelf.pvWaitingForResult.setProgress(progressUpdate, animated: true)
            
            if wSelf.pvWaitingForResult.progress == 1 {
                wSelf.timer.invalidate()
                wSelf.timer = nil
                wSelf.indicatorWaitingForResult.stopAnimating()
                wSelf.showResult(result: result)
            }
        })
    }
    
    func showResult(result: String) {
//        indicatorWaitingForResult.isHidden = true
        pvWaitingForResult.isHidden = true
        tvResult.isHidden = false
        tvResult.text = result
    }
    
    func showErrorEmpty(fieldName: String) {
        let alert = UIAlertController(title: "Error!", message: "\(fieldName) cannot empty!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpInitial()
        
    }
    
    func setUpInitial(){
        pvWaitingForResult.isHidden = true
//        indicatorWaitingForResult.isHidden = true
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

extension ViewController13: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == tfWeight {
//            tfHeight.becomeFirstResponder()
//        } else if textField == tfHeight {
//            self.view.endEditing(true)
//        }
//        return true
        
        if textField == tfFirstname {
            tfLastname.becomeFirstResponder()
        } else if textField == tfLastname {
            tfLastname.resignFirstResponder()
            //self.view.endEditing(true)
        }
        return true
    }
}
