//
//  ViewController6.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/21/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController6: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("action cancel")
        }
        
        let actionDefault = UIAlertAction(title: "Default", style: .default) { (_) in
            print("action default")
        }
        
        let actionDestructive = UIAlertAction(title: "Destructive", style: .destructive) { (_) in
            print("action destructive")
        }
        
        alertController.addAction(actionCancel)
        alertController.addAction(actionDefault)
        alertController.addAction(actionDestructive)
        
        self.present(alertController, animated: true, completion: nil)
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
