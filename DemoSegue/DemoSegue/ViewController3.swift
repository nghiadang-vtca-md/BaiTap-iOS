//
//  ViewController3.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/29/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backToScreen2(_ sender: UIButton) {
        // cách 1: sử dụng code
        self.dismiss(animated: true, completion: nil) // chỉ tác dụng với PRESENT MODALLY
        // cách 2: sử dụng trên kéo thả
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
