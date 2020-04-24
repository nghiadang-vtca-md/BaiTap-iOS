//
//  ChatsViewController.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/24/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: IBActions
    @IBAction func createNewChatButtonPressed(_ sender: Any) {
        let usersVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersTableView") as! UsersTableViewController
        self.navigationController?.pushViewController(usersVC, animated: true)
    }
    
}
