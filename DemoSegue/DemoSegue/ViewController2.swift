//
//  ViewController2.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/27/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var myText = "" // chú ý sử dụng biến tạm
    // vì biến outlet chưa được khởi tạo
   
    @IBAction func btnBackToScreen1(_ sender: UIButton) {
        // cách 1: sử dụng code
        self.dismiss(animated: true, completion: nil) // chỉ tác dụng với PRESENT MODALLY
        // cách 2: sử dụng trên kéo thả
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myLabel.text = myText
    }
}
