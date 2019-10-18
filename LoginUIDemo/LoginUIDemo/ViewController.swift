//
//  ViewController.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/18/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Properties
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblStatusResult: UILabel!
    // Actions
    @IBAction func btnLogin(_ sender: UIButton) {
        do {
            try login(username: tfUsername.text!, password: tfPassword.text!)
            lblStatusResult.text = "Success"
        } catch ErrorLogin.emptyField(let result) {
            if result == "username" {
                lblStatusResult.text = "Failure (username is empty)"
            } else {
                lblStatusResult.text = "Failure (password is empty)"
            }
        } catch ErrorLogin.unmatch {
            lblStatusResult.text = "Failure (username unmatch with database)"
        } catch ErrorLogin.wrongPassword {
            lblStatusResult.text = "Failure (wrong password)"
        } catch {
            lblStatusResult.text = "Cannot detect"
        }
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
    }
    //
    let usernameInit = "nghiadang"
    let passwordInit = "123456"
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblStatusResult.numberOfLines = 0
        lblStatusResult.sizeToFit()
        // chưa giải quyết được align left-top cho label
        
        
        
        let lblDemoRuntimeModify = UILabel(frame: CGRect(x: 100, y: 100, width: 300, height: 50))
        
        lblDemoRuntimeModify.text = "This is a label"
        lblDemoRuntimeModify.font = UIFont.boldSystemFont(ofSize: 30)
        lblDemoRuntimeModify.textAlignment = .center
        lblDemoRuntimeModify.backgroundColor = .blue
        lblDemoRuntimeModify.textColor = .white
        lblDemoRuntimeModify.numberOfLines = 0
        lblDemoRuntimeModify.lineBreakMode = .byWordWrapping
        //lblDemoRuntimeModify.frame = CGRect(x: 100, y: 100, width: 300, height: 50) // thiet lap khung cho label
        
        // vi tri
        lblDemoRuntimeModify.frame.origin = CGPoint(x: 30, y: 500)
        //
        
        // khong su dung keo tha
        // phai add vao subview cua viewController
        self.view.addSubview(lblDemoRuntimeModify)
        
        let myLabelInside = UILabel(frame: CGRect(x: 50, y: 50, width: 300, height: 25))
        
        myLabelInside.text = "222222"
        myLabelInside.backgroundColor = .yellow
        
        lblDemoRuntimeModify.addSubview(myLabelInside)
    }

    func login(username: String, password: String) throws {
        guard !username.isEmpty else {
            throw ErrorLogin.emptyField(field: "username")
        }
        guard !password.isEmpty else {
            throw ErrorLogin.emptyField(field: "password")
        }
        guard username == usernameInit else {
            throw ErrorLogin.unmatch
        }
        guard password == passwordInit else {
            throw ErrorLogin.wrongPassword
        }
    }
    
    enum ErrorLogin: Error {
        case wrongPassword
        case emptyField(field: String)
        case unmatch
    }
}

