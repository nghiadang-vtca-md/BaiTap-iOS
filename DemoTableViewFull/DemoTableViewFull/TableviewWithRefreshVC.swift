//
//  TableviewWithRefreshVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class TableviewWithRefreshVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var data: [FruitsNVeggies] = []
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.data = FruitsNVeggies.FoodItems()
        
        refreshControl = UIRefreshControl()
        self.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    @objc func handleRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
            self.refreshControl.endRefreshing()
            self.data[0].foodItems.insert(Food(title: "Peache", subtitle: "Peaches offer a rich treasure of minerals such as calcium, potassium, magnesium, iron, manganese, phosphorous, zinc, and copper. ", image: #imageLiteral(resourceName: "peach_small.jpg"), fullImage: #imageLiteral(resourceName: "peach.jpg")), at: 0)
            self.data[0].foodItems.insert(Food(title: "Plum", subtitle: "Plums help increase the absorption of iron into the body.", image: #imageLiteral(resourceName: "plum_small.jpg"), fullImage: #imageLiteral(resourceName: "plum.jpg")), at: 0)
            self.data[0].foodItems.insert(Food(title: "Strawberry", subtitle: " Strawberry nutrients include vitamin C, folate, potassium, manganese, dietary fiber, and magnesium.", image: #imageLiteral(resourceName: "strawberry_small.jpg"), fullImage: #imageLiteral(resourceName: "strawberry.jpg")), at: 0)
            self.tableView.reloadSections([0], with: .automatic)
        }
    }
    
}

extension TableviewWithRefreshVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let itemFood = data[indexPath.section].foodItems[indexPath.row]
        cell?.textLabel?.text = itemFood.title
        cell?.detailTextLabel?.text = itemFood.subtitle
        cell?.imageView?.image = itemFood.image
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
}

extension TableviewWithRefreshVC: UITableViewDelegate {
    
}
