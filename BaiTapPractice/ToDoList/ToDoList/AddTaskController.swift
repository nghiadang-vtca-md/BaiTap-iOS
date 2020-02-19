//
//  AddTaskController.swift
//  ToDoList
//
//  Created by nghiadang1205 on 2/14/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        item.text = text
        
        managedObjectContext.saveChanges()
        
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}
