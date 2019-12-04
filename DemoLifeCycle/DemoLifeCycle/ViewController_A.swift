//
//  ViewController_A.swift
//  DemoLifeCycle
//
//  Created by iMac_VTCA on 12/4/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController_A: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // Lưu ý:
    // nếu kéo từ view controller thì sử dụng hàm perform
    // nếu kéo trực tiếp từ button thì KHÔNG CẦN sử dụng hàm perform
    @IBAction func moveToB(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "moveToB", sender: self)
    }
    
    
    deinit {
        //
    }
    
    override func didReceiveMemoryWarning() {
        //
    }

    // phân biệt "loadView" và "viewDidLoad"
    // lưu ý khi load dữ liệu
    // + viewDidLoad: load 1 lần; nên áp dụng cho dữ liệu tĩnh
    // + viewDidAppear: load khi ra vào; áp dụng cho dữ liệu động

}
