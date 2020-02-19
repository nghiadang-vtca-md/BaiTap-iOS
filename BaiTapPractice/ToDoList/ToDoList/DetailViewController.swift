//
//  DetailViewController.swift
//  ToDoList
//
//  Created by nghiadang1205 on 2/15/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var item: Item?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = item {
            detailTextField.text = item.text
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveItem(_ sender: Any) {
        if let item = item, let newText = detailTextField.text {
            item.text = newText
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = item {
            context.delete(item)
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
}
