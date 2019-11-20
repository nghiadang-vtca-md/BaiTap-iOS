//
//  ViewController.swift
//  DemoAutoLayout
//
//  Created by iMac_VTCA on 11/20/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLeftView: UIView!
    @IBOutlet weak var topRightView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(topLeftView.frame)
        print(topRightView.frame)
    }
    // sự kiện khi xoay màn hình
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
}

// chú ý view bị chồng lên nhau
// chú ý SafeArea và View
// check bỏ "Constraint to margin"
// Update Frames
// Proposition chỉnh lại tỉ lệ là 1 cho đúng


