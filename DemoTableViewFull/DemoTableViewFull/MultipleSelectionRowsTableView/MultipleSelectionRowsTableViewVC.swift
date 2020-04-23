//
//  MultipleSelectionRowsTableViewVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class MultipleSelectionRowsTableViewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editView: UIView!
    
    var data: [Food] = []
    var selectedData = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.editView.isHidden = true
        
        for item in FruitsNVeggies.FoodItems() {
            self.data.append(contentsOf: item.foodItems)
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //self.tableView.isEditing = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            self.tableView.setEditing(true, animated: animated)
            animate(toggle: true)
        } else {
            self.tableView.setEditing(false, animated: animated)
            animate(toggle: false)
        }
    }
    
    func animate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.editView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.editView.isHidden = true
            }
        }
        
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        print("===========================================")
        print("\(self.selectedData.count) items are selected")
        for item in self.selectedData {
            print(item.title)
        }
        print("===========================================")
    }
    
    @IBAction func selectAllButtonPressed(_ sender: UIButton) {
        self.selectedData.removeAll()
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            for row in 0..<data.count {
                self.tableView.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
            }
            //            sender.isSelected = false
            sender.setImage(UIImage(named: "checkmark"), for: .normal)
            self.selectedData = data
        } else {
            for row in 0..<data.count {
                self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: false)
            }
            //            sender.isSelected = true
            sender.setImage(UIImage(named: "empty-circle"), for: .normal)
            self.selectedData.removeAll()
        }
    }
    
}

extension MultipleSelectionRowsTableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let foodItem = data[indexPath.row]
        cell.textLabel?.text = foodItem.title
        cell.detailTextLabel?.text = foodItem.subtitle
        cell.imageView?.image = foodItem.image
        
        return cell
    }
    
    
}

extension MultipleSelectionRowsTableViewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tableView: tableView, indexPath: indexPath)
        
        print("selected")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectDeselectCell(tableView: tableView, indexPath: indexPath)
        print("deselected")
    }
}

extension MultipleSelectionRowsTableViewVC {
    // Select and deselect TableViewCell
    
    func selectDeselectCell(tableView: UITableView, indexPath: IndexPath) {
        self.selectedData.removeAll()
        if let selectedFoods = tableView.indexPathsForSelectedRows {
            for index in selectedFoods {
                selectedData.append(data[index.row])
            }
        }
        print(selectedData)
    }
}
