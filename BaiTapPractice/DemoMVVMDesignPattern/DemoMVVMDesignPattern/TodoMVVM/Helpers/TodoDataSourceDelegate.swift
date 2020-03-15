//
//  TodoDataSourceDelegate.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

import UIKit

protocol ToDoItemTappedDelegate: class {
    func setCompletedState(index: Int, completion: @escaping () -> Void)
}

class ToDoDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel: ToDoViewModel
    
    weak var delegate: ToDoItemTappedDelegate? = nil
    
    init(viewModel: ToDoViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoCell else {
            return UITableViewCell()
        }
        
        let item = viewModel.itemAt(index: indexPath.row)
        
        cell.todo = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.setCompletedState(index: indexPath.row, completion: {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        })
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}
