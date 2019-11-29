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
    
    @IBAction func backToScreen1(_ segue: UIStoryboardSegue) { // phải có kiểu dữ liệu này thì kéo thả đến EXIT mới nhận được
        // cách này gọi là UNWIND
    }
    
    
    @IBAction func moveToScreen2_programmatically(_ sender: UIButton) {
        //Bước 1: đặt tên cho StoryboardID cho 2 ViewController + use
        //Bước 2: lấy ra storyboard chứa 2 ViewController cần thao tác
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //Bước 3: lấy ra view cần chuyển hướng
        if let secondVC = storyboard.instantiateViewController(identifier: "ViewController2") as? ViewController2 {
            // Bước 4: Show
            self.present(secondVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

