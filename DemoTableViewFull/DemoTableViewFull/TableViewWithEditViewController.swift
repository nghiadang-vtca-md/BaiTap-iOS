//
//  TableViewWithEditViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/17/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class TableViewWithEditViewController: UIViewController {

    /*
    Lưu ý: cấu hình lại "Main interface" ở General và "Storyboard name" ở info.plist
    */
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [FruitsNVeggies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        self.data = FruitsNVeggies.FoodItems()
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            self.tableView.setEditing(true, animated: animated)
        } else {
            self.tableView.setEditing(false, animated: animated)
        }
    }
}

extension TableViewWithEditViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = data[indexPath.section].foodItems[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
}

extension TableViewWithEditViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data[indexPath.section].foodItems.remove(at: indexPath.row)
            //tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
