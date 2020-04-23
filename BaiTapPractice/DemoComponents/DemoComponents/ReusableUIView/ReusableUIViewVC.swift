//
//  ReusableUIViewVC.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/29/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ReusableUIViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addProfileHeaderTo(vc: self)
    }
    
    func addProfileHeaderTo(vc: UIViewController) {
        let profileHeader = ProfileHeaderVC(nibName: "ProfileHeaderVC", bundle: nil)
        vc.view.addSubview(profileHeader.view)
        vc.addChild(profileHeader)
    }
    
    @IBAction func navigateToDetailScreen() {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "ProfileDetailVC") as! ProfileDetailVC
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
