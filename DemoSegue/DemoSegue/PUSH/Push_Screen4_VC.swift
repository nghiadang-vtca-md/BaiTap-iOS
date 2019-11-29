//
//  Push_Screen4_VC.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/29/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class Push_Screen4_VC: UIViewController {
    
    @IBAction func moveBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moveToRoot(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
        
    @IBAction func moveToScreen2(_ sender: UIButton) {
        guard let controller = self.navigationController?.viewControllers[1] else { return }
        self.navigationController?.popToViewController(controller, animated: true)
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
