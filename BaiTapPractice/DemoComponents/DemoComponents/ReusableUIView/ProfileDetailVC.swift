//
//  ProfileDetailVC.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/29/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ProfileDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateBack() {
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
