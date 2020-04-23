//
//  TableViewWithInsertViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/17/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class TableViewWithInsertViewController: UIViewController {
    
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
        self.tableView.allowsSelectionDuringEditing = true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            self.tableView.setEditing(true, animated: animated)
            
            tableView.beginUpdates()
            
            for (idx, set) in data.enumerated() {
                let indexPath = IndexPath(row: set.foodItems.count, section: idx)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            
            tableView.endUpdates()
        } else {
            self.tableView.setEditing(false, animated: animated)
            
            tableView.beginUpdates()
            
            for (idx, set) in data.enumerated() {
                let indexPath = IndexPath(row: set.foodItems.count, section: idx)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            tableView.endUpdates()
        }
    }
}

extension TableViewWithInsertViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let extraCell = isEditing ? 1 : 0
        
        return data[section].foodItems.count + extraCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row >= data[indexPath.section].foodItems.count && isEditing {
            cell.textLabel?.text = "Add new"
            cell.detailTextLabel?.text = nil
            cell.imageView?.image = nil
        } else {
            let item = data[indexPath.section].foodItems[indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.subtitle
            cell.imageView?.image = item.image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
}

extension TableViewWithInsertViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data[indexPath.section].foodItems.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
        } else if editingStyle == .insert {
            let newFood = Food(title: "New food", subtitle: "New food desc", image: #imageLiteral(resourceName: "apple_small"), fullImage: #imageLiteral(resourceName: "apple"))
            data[indexPath.section].foodItems.append(newFood)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row >= data[indexPath.section].foodItems.count && isEditing {
            return .insert
        }
        return .delete
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row >= data[indexPath.section].foodItems.count && isEditing {
            return indexPath
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isEditing && indexPath.row >= data[indexPath.section].foodItems.count {
            tableView.deselectRow(at: indexPath, animated: true)
            self.tableView(tableView, commit: .insert, forRowAt: indexPath)
        }
    }
}
