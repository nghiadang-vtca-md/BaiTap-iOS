//
//  ExpandTableViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ExpandTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [FruitsNVeggies] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.data = FruitsNVeggies.FoodItems()
        
        // hide table view footer
        tableView.tableFooterView = UIView()
    }
    
    @objc func handleSelectionToggle(sender: UIButton) {
        data[sender.tag].isExpanded = !data[sender.tag].isExpanded // swap
        tableView.reloadSections([sender.tag], with: .automatic)
    }

   

}


extension ExpandTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isExpanded {
            return data[section].foodItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let foodItem = data[indexPath.section].foodItems[indexPath.row]
        cell?.textLabel?.text = foodItem.title
        cell?.detailTextLabel?.text = foodItem.subtitle
        cell?.imageView?.image = foodItem.image
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.data[section].name
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "      \(data[section].name)"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.systemTeal
        
        let button = UIButton()
        button.backgroundColor = UIColor.systemTeal
        if data[section].isExpanded {
            button.setTitle("Hide       ", for: .normal)
        } else {
            button.setTitle("Show       ", for: .normal)
        }
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleSelectionToggle(sender:)), for: .touchUpInside)
        button.tag = section
        
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.contentMode = .scaleToFill
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }
    
}

extension ExpandTableViewController: UITableViewDelegate {
    
}
