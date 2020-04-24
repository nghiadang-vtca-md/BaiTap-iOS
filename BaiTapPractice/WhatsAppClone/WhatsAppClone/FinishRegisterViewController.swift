//
//  FinishRegisterViewController.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/24/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit
import ProgressHUD

class FinishRegisterViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var email: String!
    var password: String!
    var avatarImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: IBActions
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        cleanTextFields()
        dismissKeyboard()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismissKeyboard()
        
        
        if nameTextField.text != "" && surnameTextField.text != "" && countryTextField.text != "" && cityTextField.text != "" && phoneTextField.text != "" {
            ProgressHUD.show("Registering...")
            FUser.registerUserWith(email: email!, password: password!, firstName: nameTextField.text!, lastName: surnameTextField.text!) { (error) in
                
                if error != nil {
                    ProgressHUD.dismiss()
                    ProgressHUD.showError(error!.localizedDescription)
                    return
                }
                
                self.registerUser()
                
                
            }
            
        } else {
            ProgressHUD.showError("All fields are required!")
        }
        
    }
    
    // MARK: Functions
    
    func registerUser() {
        let fullName = nameTextField.text! + " " + surnameTextField.text!
        
        var tempDictionary: Dictionary = [kFIRSTNAME: nameTextField.text!, kLASTNAME: surnameTextField.text!, kFULLNAME: fullName, kCOUNTRY: countryTextField.text!, kCITY: cityTextField.text!, kPHONE: phoneTextField.text!] as [String: Any]
        
        if avatarImage == nil {
            imageFromInitials(firstName: nameTextField.text!, lastName: surnameTextField.text!) { (avatarInitials) in
                
                let avatarIMG = avatarInitials.jpegData(compressionQuality: 0.7)
                let avatar = avatarIMG?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
                
                tempDictionary[kAVATAR] = avatar
                
                self.finishRegistration(withValues: tempDictionary)
            }
        } else {
            let avatarData = avatarImage?.jpegData(compressionQuality: 0.7)
            let avatar = avatarData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
            tempDictionary[kAVATAR] = avatar
            
            self.finishRegistration(withValues: tempDictionary)
        }
    }
    
    func finishRegistration(withValues: [String: Any]) {
        updateCurrentUserInFireStore(withValues: withValues) { (error) in
            if error != nil {
                DispatchQueue.main.sync {
                    ProgressHUD.showError(error!.localizedDescription)
                }
                return
            }
            
            ProgressHUD.dismiss()
            self.goToApp()
        }
    }
    
    func goToApp() {
        cleanTextFields()
        dismissKeyboard()
        
        NotificationCenter.default.post(name: NSNotification.Name(USER_DID_LOGIN_NOTIFICATION), object: nil, userInfo: [kUSERID: FUser.currentId()])
        
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainApplication") as! UITabBarController
        self.present(mainView, animated: true, completion: nil)
    }
    
    // MARK: Helpers
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func cleanTextFields() {
        nameTextField.text = ""
        surnameTextField.text = ""
        countryTextField.text = ""
        cityTextField.text = ""
        phoneTextField.text = ""
    }
}
