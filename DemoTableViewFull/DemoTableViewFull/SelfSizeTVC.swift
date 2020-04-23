//
//  SelfSizeTVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/17/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class SelfSizeTVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [FruitsNVeggies] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        data = FruitsNVeggies.FoodItems()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 128 // bằng với thiết lập ở giao diện
        tableView.rowHeight = UITableView.automaticDimension
    }
    

    

}

extension SelfSizeTVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelfSizingCell
        let item = self.data[indexPath.section].foodItems[indexPath.row]
        cell.setCell(food: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
}

extension SelfSizeTVC: UITableViewDelegate {
    
}
