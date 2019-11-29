//
//  Push_Screen2_VC.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/29/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class Push_Screen2_VC: UIViewController {

    @IBAction func moveNext(_ sender: UIButton) {
        // tên identifier này là tên của segue
        self.performSegue(withIdentifier: "moveToScreen3", sender: self)
    }
    
    @IBAction func moveBack(_ sender: UIButton) {
        // lưu ý thuộc tính "self.navigationController" nếu ViewController không nằm trong
        // Navigation Controller thì sẽ trả về nil
        self.navigationController?.popViewController(animated: true)
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
