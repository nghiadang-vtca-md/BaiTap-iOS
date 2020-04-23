//
//  SelectTimeViewController.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/22/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // Cách 1: Kéo "storyboard reference" từ Library
    // sau đó kéo "Select Date" vào storyboard đó -> Chọn Present Modally
    
    // Cách 2:
    @IBAction func selectTime_TouchUpInside(_ sender: UIButton) {
        let sb = UIStoryboard(name: "PopUp", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! PopUp
        popup.showTimePicker = true
        self.present(popup, animated: true, completion: nil)
    }

}
