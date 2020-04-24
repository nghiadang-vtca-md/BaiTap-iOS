//
//  FinishRegisterViewController.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/24/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit

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

        // Do any additional setup after loading the view.
    }
    

    // MARK: IBActions
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
    }
}
