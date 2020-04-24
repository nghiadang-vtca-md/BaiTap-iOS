//
//  WelcomeViewController.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/23/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit
import ProgressHUD

class WelcomeViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        dismissKeyboard()
        
        // Read more about Password
        // medium.com/developerinsider/ios12-password-autofill-automatic-strong-password-and-security-code-autofill-6e7db8da1810
        if emailTextField.text != "" && passwordTextField.text != "" {
            loginUser()
        } else {
            ProgressHUD.showError("Email and password cannot empty!")
        }
        
    }

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        dismissKeyboard()
        
        // Read more about Password
        // medium.com/developerinsider/ios12-password-autofill-automatic-strong-password-and-security-code-autofill-6e7db8da1810
        if emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != "" {
            if passwordTextField.text == repeatPasswordTextField.text {
                registerUser()
            } else {
                ProgressHUD.showError("Passwords don't match!")
            }
            
        } else {
            ProgressHUD.showError("All fields are required!")
        }
    }
    
    @IBAction func backgroundTap(_ sender: Any) {
        print("dismiss")
        dismissKeyboard()
    }
    
    // MARK: Helper functions
    func loginUser() {
        ProgressHUD.show("Login...")
        
        FUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
    
            self.goToApp()
        }
    }
    
    func registerUser() {
        performSegue(withIdentifier: "welcomeToFinishRegister", sender: self)
        
        cleanTextFields()
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func cleanTextFields() {
        emailTextField.text = ""
        passwordTextField.text = ""
        repeatPasswordTextField.text = ""
    }
    
    // MARK: GoToApp
    
    func goToApp() {
        ProgressHUD.dismiss()
        cleanTextFields()
        dismissKeyboard()
        
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainApplication") as! UITabBarController
        self.present(mainView, animated: true, completion: nil)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "welcomeToFinishRegister" {
            if let vc = segue.destination as? FinishRegisterViewController {
                vc.email = emailTextField.text!
                vc.password = passwordTextField.text!
            }
        }
    }
    
}
