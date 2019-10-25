//
//  ViewController11.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/25/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController11: UIViewController {

    @IBOutlet weak var mySlider: UISlider!
    
    @IBAction func mySlider_ValueChanged(_ sender: UISlider) {
        print(mySlider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
