//
//  ToDoListViewController.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ToDoViewModel!
    var dataSource: ToDoDataSourceDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ToDoViewModel()
        dataSource = ToDoDataSourceDelegate(viewModel: viewModel)
        dataSource.delegate = self
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func didTapAddNew(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "gotoNewToDo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoNewToDo" {
            if let vc = segue.destination as? ToDoAddNewViewController {
                vc.delegate = self
            }
        }
    }

}

extension ToDoListViewController: AddNewItemProtocol {
    func didAddedNewItem(addVM: AddNewToDoViewModel) {
        if let newTodo = addVM.newTodo {
            viewModel.addNew(todo: newTodo)
        }
    }
    
    
}

extension ToDoListViewController: ToDoItemTappedDelegate {
    func setCompletedState(index: Int, completion: @escaping () -> Void) {
        let alertViewController = UIAlertController(title: "Mark completed?", message: "Mark this item as completed?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            self.viewModel.updateCompletedState(index: index, newValue: true)
            completion()
        }
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertViewController.addAction(yesAction)
        alertViewController.addAction(noAction)
        present(alertViewController, animated: true, completion: nil)
    }
    
    
}
