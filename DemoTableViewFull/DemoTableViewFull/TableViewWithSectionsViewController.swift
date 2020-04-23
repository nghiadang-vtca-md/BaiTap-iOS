//
//  TableViewWithSectionsViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/16/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class TableViewWithSectionsViewController: UIViewController {
    
    /*
     Lưu ý: cấu hình lại "Main interface" ở General và "Storyboard name" ở info.plist
     */
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [FruitsNVeggies] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        self.data = FruitsNVeggies.FoodItems()
    }
    

}

extension TableViewWithSectionsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let itemSection = data[indexPath.section]
        let item = itemSection.foodItems[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.data[section].name
    }
    
}

extension TableViewWithSectionsViewController: UITableViewDelegate {
    
}
