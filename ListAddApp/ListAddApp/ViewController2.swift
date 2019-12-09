//
//  ViewController2.swift
//  ListAddApp
//
//  Created by iMac_VTCA on 12/9/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

protocol CallBackDelegate {
    func addItemFinished(title: String, description: String)
}

class ViewController2: UIViewController {

    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    var myDelegate: CallBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func done_click(_ sender: UIButton) {
        if let _title = tfTitle.text, let _description = tfDescription.text {
            myDelegate?.addItemFinished(title: _title, description: _description)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

}
