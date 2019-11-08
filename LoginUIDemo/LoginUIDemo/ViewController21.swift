//
//  ViewController21.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/8/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController21: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myTableView.dataSource = self
        
        //myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell") // cách này của cách 2
        let nib = UINib(nibName: "ViewController21", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "myCell")
    }


    /* tạo table view cell bằng file .xib
    Cách 3:
     - Tạo màn hình chứa TableView và adđ ViewController cho màn hình đó
     TH1: Tạo sub là UITableViewCell có check tạo file .xib chung
     TH2: + Tạo file xib riêng bằng cách New file -> View -> Chọn kiểu freedom
          + tạo file kế thừa UITableViewCell add tên vô file .xib để xử lý
     
     
     
     
    */

}

extension ViewController21: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? ViewController21_TableViewCell else { return UITableViewCell()
        }
        
        cell.myLabel.text = "\(indexPath.row)"
        return cell
    }
    
    
}
