//
//  DropdownListTableViewVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class DropdownListTableViewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dropButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    var data: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        textLabel.isHidden = true
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
    }
    
    @IBAction func dropButtonPressed(_ sender: UIButton) {
        if tableView.isHidden {
            animate(toggle: true, type: dropButton)
        } else {
            animate(toggle: false, type: dropButton)
        }
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
       if textLabel.isHidden {
            animate(toggle: true, type: showButton)
        } else {
            animate(toggle: false, type: showButton)
        }
    }
    
    func animate(toggle: Bool, type: UIButton) {
        if type == dropButton {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.tableView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.tableView.isHidden = true
                }
            }
        } else if type == showButton {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.textLabel.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.textLabel.isHidden = true
                }
            }
        }
        
        
        
    }
    
    
}

extension DropdownListTableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let foodItem = data[indexPath.row]
        cell?.textLabel?.text = foodItem.title
        
        return cell!
    }
    
    
}

extension DropdownListTableViewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropButton.setTitle("\(data[indexPath.row].title)", for: .normal)
        animate(toggle: false, type: dropButton)
    }
}
