//
//  Push_Screen3_VC.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/29/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class Push_Screen3_VC: UIViewController {

    @IBAction func moveBack(_ sender: UIButton) {
        // lưu ý thuộc tính "self.navigationController" nếu ViewController không nằm trong
        // Navigation Controller thì sẽ trả về nil
        self.navigationController?.popViewController(animated: true)
        
        // quay về màn hình đầu tiên
        //self.navigationController?.popToRootViewController(animated: true)
        
        // chỉ định viewController cần di chuyển về
        //self.navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    
    @IBAction func moveNext(_ sender: UIButton) {
        self.performSegue(withIdentifier: "moveToScreen4", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
