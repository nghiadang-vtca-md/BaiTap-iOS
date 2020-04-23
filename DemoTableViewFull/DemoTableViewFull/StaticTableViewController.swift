//
//  StaticTableViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/17/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class StaticTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [FruitsNVeggies] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.data = FruitsNVeggies.FoodItems()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let detailsTableViewController = segue.destination as? DetailsTableViewController {
                detailsTableViewController.food = sender as? Food
            }
        }
    }

}

extension StaticTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let food = data[indexPath.section].foodItems[indexPath.row]
        cell?.textLabel?.text = food.title
        cell?.detailTextLabel?.text = food.subtitle
        cell?.imageView?.image = food.image
        return cell!
    }
    
    
}

extension StaticTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemForSending = self.data[indexPath.section].foodItems[indexPath.row]
        self.performSegue(withIdentifier: "details", sender: itemForSending)
    }
}
