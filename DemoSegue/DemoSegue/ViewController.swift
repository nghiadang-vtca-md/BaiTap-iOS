//
//  ViewController.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/27/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func GoToScreen2_Click(_ sender: UIButton) {
        
        let text = myTextField.text ?? ""
        guard text != "" else {
            let alert = UIAlertController(title: "warning ", message: "Please input text", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            return
        }
        // Cách 1: không truyền dữ liệu
        //self.performSegue(withIdentifier: "goToScreen2", sender: nil)
        
        // Cách 2: truyền dữ liệu
        // nếu có 2 param trở lên thì sử dụng DICTIONARY
        let paramValue = "test test test"
        self.performSegue(withIdentifier: "goToScreen2", sender: paramValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(12312312312)
        if let controller = segue.destination as?  ViewController2 {
            // lấy giá trị từ sender
            let value = sender as? String ?? ""
            controller.myText = value
            //
            //controller.myText = myTextField.text ?? ""
        }
    }
    
    @IBAction func backToScreen1(_ segue: UIStoryboardSegue) { // phải có kiểu dữ liệu này mới nhận được
        // cách này gọi là UNWIND
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

