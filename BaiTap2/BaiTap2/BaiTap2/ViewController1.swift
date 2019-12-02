//
//  ViewController1.swift
//  BaiTap2
//
//  Created by iMac_VTCA on 12/2/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    
    
    
    @IBAction func moveToGreen(_ sender: UIButton) {
        //let viewControllerBlue = ViewController() // phải load bằng storyboard
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerBlue = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            // thể hiện bằng Show (Push)
            // thêm Navigation mặc định ở SceneDelegate
            self.navigationController?.pushViewController(viewControllerBlue, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /* Load view controller
     Load bằng nibName: đối với file .xib
     Load bằng StỏyBoard
     
     */


    
    

}
