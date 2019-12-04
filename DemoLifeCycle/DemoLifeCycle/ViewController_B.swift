//
//  ViewController_B.swift
//  DemoLifeCycle
//
//  Created by iMac_VTCA on 12/4/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController_B: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveToA(_ sender: UIButton) {
        // back to A using "Pop"
        self.navigationController?.popViewController(animated: true)
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
