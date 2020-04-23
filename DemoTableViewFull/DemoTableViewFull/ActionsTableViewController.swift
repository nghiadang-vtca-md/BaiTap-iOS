//
//  ActionsTableViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ActionsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Food] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 100
        
    }

}

extension ActionsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell else {
            return UITableViewCell()
        }
        
        let item = data[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        return cell
    }
    
    
}

extension ActionsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let archiveAction = UIContextualAction(style: .normal, title: "Archive") { ( action, view, _) in
            print("User selected Archive")
        }
        let saveAction = UIContextualAction(style: .normal, title: "Save") { ( action, view, _) in
            print("User selected Save")
        }
        
        archiveAction.backgroundColor = UIColor.brown
        archiveAction.image = UIImage(systemName: "archivebox")
        saveAction.backgroundColor = UIColor.systemBlue
        saveAction.image = UIImage(systemName: "arrow.down.doc")
        
        let config = UISwipeActionsConfiguration(actions: [archiveAction, saveAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let infoAction = UIContextualAction(style: .normal, title: "Info") { ( action, view, _) in
            print("User selected Info")
        }
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { ( action, view, _) in
            print("User selected delete")
        }
        
        infoAction.backgroundColor = UIColor.green
        infoAction.image = UIImage(systemName: "info.circle")
        deleteAction.backgroundColor = UIColor.systemRed
        deleteAction.image = UIImage(systemName: "trash")
        
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, infoAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}
