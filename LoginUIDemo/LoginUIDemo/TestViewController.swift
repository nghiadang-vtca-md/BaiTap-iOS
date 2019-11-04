//
//  TestViewController.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/4/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")

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

//tablview co 3 section
//section 0 chua 5 row
//section 1 chua 2 row
//section 2 chua 10 row


extension TestViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numSection = 0
        
        switch section {
        case 0:
            numSection = 5
        case 1:
            numSection = 2
        case 2:
            numSection = 100000
        default:
            print(123)
        }
        return numSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        let text = "section = \(section) & row = \(row)"
        print(text)
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell()
        }
        
        cell?.textLabel?.text = text
        
        return cell!
    }
    
    
}
