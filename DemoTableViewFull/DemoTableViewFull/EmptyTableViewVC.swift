//
//  EmptyTableViewVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class EmptyTableViewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noContentView: UIView!
    

    var data: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = noContentView
        tableView.tableFooterView = UIView()
        loadDataWithDelay()
    }
    
    func loadDataWithDelay() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).asyncAfter(deadline: .now() + .milliseconds(5000)) {
            for item in FruitsNVeggies.FoodItems() {
                self.data.append(contentsOf: item.foodItems)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension EmptyTableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let foodItem = data[indexPath.row]
        cell?.textLabel?.text = foodItem.title
        cell?.detailTextLabel?.text = foodItem.subtitle
        cell?.imageView?.image = foodItem.image
        
        return cell!
    }
    

}

extension EmptyTableViewVC: UITableViewDelegate {
    
}
