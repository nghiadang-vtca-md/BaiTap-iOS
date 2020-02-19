//
//  TodoListController.swift
//  ToDoList
//
//  Created by nghiadang1205 on 2/14/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import CoreData

class TodoListController: UITableViewController {

    let managedObjectContext = CoreDataStack().managedObjectContext
    
    lazy var dataSource: DataSource = {
        return DataSource(tableView: self.tableView, context: self.managedObjectContext)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
    }
    
    
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskController
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailViewController, let indexPathSelected = tableView.indexPathForSelectedRow else {
                return
            }
            let item = dataSource.object(at: indexPathSelected)
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
    }
}
