//
//  BViewController.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/29/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .green
        createButton()
    }
    
    private func createButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        button.setTitle("Move back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(moveBack), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc private func moveBack() {
        // Này dùng cho Present Modally
        //self.dismiss(animated: true, completion: nil)
        
        // Này dùng cho Show (Push)
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
