//
//  ViewController5.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/21/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {

    @IBOutlet weak var tfDemo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let btnLeftViewButton: UIButton = UIButton.init(type: .custom)
        btnLeftViewButton.frame = CGRect(x: 0, y: 0, width: 26, height: 16)
        btnLeftViewButton.setImage(UIImage(named: "search_ic"), for: .normal)
        btnLeftViewButton.contentMode = .center
        btnLeftViewButton.addTarget(self, action: #selector(showMessageBox), for: .touchUpInside)
        
        tfDemo.leftView = btnLeftViewButton
        tfDemo.leftViewMode = .always
    }
    
    @objc func showMessageBox(){
        print("This is an search icon.")
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
