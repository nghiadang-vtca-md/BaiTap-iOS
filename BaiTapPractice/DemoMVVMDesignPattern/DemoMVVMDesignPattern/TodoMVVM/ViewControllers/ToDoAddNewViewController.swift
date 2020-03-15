//
//  ToDoAddNewViewController.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

protocol AddNewItemProtocol: class {
    func didAddedNewItem(addVM: AddNewToDoViewModel)
}

class ToDoAddNewViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    
    var viewModel = AddNewToDoViewModel()
    
    weak var delegate: AddNewItemProtocol? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
        guard let task = taskTextField.text, !task.isEmpty, let notes = notesTextField.text, !notes.isEmpty else {
            return
        }
        let todo = ToDo(task: task, completed: false, notes: notes)
        viewModel.newTodo = todo
        self.delegate?.didAddedNewItem(addVM: viewModel)
        navigationController?.popViewController(animated: true)
    }
    
    

}
