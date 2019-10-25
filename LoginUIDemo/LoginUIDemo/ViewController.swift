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
        
        
        // Button
        
        
        let buttonDemo = UIButton(frame: CGRect(x: 100, y: 350, width: 100, height: 50))
        buttonDemo.setTitle("NghiaDang", for: .normal)
        buttonDemo.setTitleColor(.red, for: .highlighted)
        buttonDemo.backgroundColor = .gray
        buttonDemo.addTarget(self, action: #selector(buttonDemo_Click), for: .touchUpInside)
        
        self.view.addSubview(buttonDemo)
        
        
        
        // end Button
    }
    // For Button
    @objc func buttonDemo_Click(){
        print("my button clicked")
    }
    // end For Button

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

/* Note for Button UI:

- State "Enable" (uncheck) khác với Interaction "User interaction enabled" (uncheck)
 - BackgroundImage nằm trên Image ; hành vi của background sẽ làm mở hình khi hightlight
 
 - Chú ý khi kéo thả hình
    + check copy
    + lưu ý phải kéo thả vào mới được ( download trực tiếp về project vẫn không được )
 
 - tạo button bằng programmatically
 
 - tạo action cho button programmatically
    + fix lỗi (Add '@objc' to expose this instance method to Objective-C ) - do ruột là Objective-C
*/

