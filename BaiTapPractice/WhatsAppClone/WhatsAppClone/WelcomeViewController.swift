//
//  WelcomeViewController.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/23/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit

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
        print("login")
    }

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        print("register")
    }
    
    @IBAction func backgroundTap(_ sender: Any) {
        print("dismiss")
    }
    
}
