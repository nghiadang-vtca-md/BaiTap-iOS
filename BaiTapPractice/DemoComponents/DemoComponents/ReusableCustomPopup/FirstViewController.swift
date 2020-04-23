//
//  FirstViewController.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/22/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPopUpVC" {
            let popup = segue.destination as! PopUp
            popup.showTimePicker = false
        }
    }

}
