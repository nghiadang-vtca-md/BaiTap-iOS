//
//  ViewController17.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/1/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController17: UIViewController {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myToolbar: UIToolbar!
    
    @IBOutlet weak var myToolbarWithTextField: UIToolbar!
    @IBOutlet weak var myTextFieldInsideToolbar: UITextField!
    
    @IBAction func Send_ItemButtonBar(_ sender: UIBarButtonItem) {
//        self.view.endEditing(true)
        myTextFieldInsideToolbar.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // dynamic code
        let toolBarDynamic = UIToolbar(frame: CGRect(x: 10, y: 300, width: 400, height: 50))
        
        
        let item1 = UIBarButtonItem(title: "Item1", style: .plain, target: self, action: #selector(hideAccesories))
        let item2 = UIBarButtonItem(title: "Item2", style: .plain, target: self, action: #selector(hideAccesories))
        let item3 = UIBarButtonItem(title: "Item3", style: .plain, target: self, action: #selector(hideAccesories))
        let item4 = UIBarButtonItem(title: "Item4", style: .plain, target: self, action: #selector(hideAccesories))
        let arrayItemBar = [item1, item2, item3, item4]
        
        toolBarDynamic.items = arrayItemBar
        
        self.view.addSubview(toolBarDynamic)
        
        // end dynamic code
        
        // Thêm accessory cho TextField khi hiện keyboard
        myTextField.inputAccessoryView = myToolbarWithTextField
        
        
    }
    
    @objc func hideAccesories() {
        //myTextField.resignFirstResponder()
    }
    

    /*
     - độ dài màn hình
        self.view.frame.size.width ( tính theo viewcontroller)
        UIScreen.main.bounds.width ( tính theo kích cỡ màn hình )
     
     
     - phân biệt frame và bounds
        frame trả về x = 20 ; y = 20 ; width = 100 ; height = 50
        bounds trả về x = 0 ; y = 0 ; width = 100 ; height 50 ( lấy toạ độ của bản thân nó là 0:0)
        
     - luyện tập thêm về những thứ liên quan đến toolbar
     
     
     - TextField trên UIToolbar
        kéo IBoutlet -> gọi .customView
        kiểm tra ( if abc.customView.ísKind(UITextField.self) -> lấy text
    */

    
    
}
