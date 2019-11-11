//
//  ViewController22.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/11/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

struct PersonalInfo {
    var number: String
    let name: String
    let age: Int
}

class ViewController22: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var btnAddUpdate: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var tbvData: UITableView!
    
    var arrayItem: [PersonalInfo] = [PersonalInfo(number: "0", name: "Nghia", age: 18),
    PersonalInfo(number: "1", name: "Nghia1", age: 19),
    PersonalInfo(number: "2", name: "Nghia2", age: 20),
    PersonalInfo(number: "3", name: "Nghia3", age: 21),
    PersonalInfo(number: "4", name: "Nghia4", age: 22)]
    var selectedRow = 0
    
    @IBAction func btnAddUpdate_Click(_ sender: UIButton) {
        if sender.titleLabel?.text == "Add" {
            guard let newItem = getDataFormUI() else {
                return
            }
            
            // binding add
            arrayItem.append(newItem)
            let newIndexPath = IndexPath(row: arrayItem.count - 1, section: 0)
            tbvData.beginUpdates()
            tbvData.insertRows(at: [newIndexPath], with: .left)
            tbvData.endUpdates()
            tbvData.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        } else {
            guard let newItemToEdit = getDataFormUI() else {
                return
            }
            arrayItem[selectedRow] = newItemToEdit
            tbvData.beginUpdates()
            tbvData.reloadRows(at: [IndexPath(row: selectedRow, section: 0)], with: .right)
            tbvData.endUpdates()
            tfName.text = ""
            tfAge.text = ""
            sender.setTitle("Add", for: .normal)
        }
        
    }
    
    
    @IBAction func btnEdit_Click(_ sender: UIButton) {
        // setup Editing ở Datasource
        let textButton = sender.titleLabel?.text
        if textButton == "Edit" {
            sender.setTitle("Done", for: .normal)
            tbvData.setEditing(true, animated: true)
        } else {
            sender.setTitle("Edit", for: .normal)
            tbvData.setEditing(false, animated: true)
        }
        //print(arrayItem)
    }
    
    @IBAction func btnClear_Click(_ sender: UIButton) {
        btnAddUpdate.setTitle("Add", for: .normal)
        sender.isHidden = true
        tfName.text = ""
        tfAge.text = ""
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tbvData.dataSource = self
        tbvData.delegate = self
        btnClear.isHidden = true
    }
    
    func getDataFormUI() -> PersonalInfo? {
        guard let name = tfName.text else {
            return nil
        }
        guard let age = tfAge.text else {
            return nil
        }
        
        return PersonalInfo(number: "0", name: name, age: Int(age) ?? 0)
    }
    

    /*
    setup hạ keyboard khi chạm vào tableView
     
    */

}

extension ViewController22: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var currentItem = arrayItem[indexPath.row]
        currentItem.number = "\(indexPath.row + 1)"
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell",for: indexPath) as? ViewController22_TableViewCell else {
            return UITableViewCell()
        }
        
        customCell.visualizeCell(item: currentItem)
        return customCell
    }
    
    // Editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Moving/reordering
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Data manipulation - reorder / moving support
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let rowSource = sourceIndexPath.row
        let item = arrayItem[rowSource]
        arrayItem.remove(at: rowSource)
        let rowDes = destinationIndexPath.row
        arrayItem.insert(item, at: rowDes)
    }
    
    
}

extension ViewController22: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //tableView.deselectRow(at: indexPath, animated: true)
            
        let cell = tableView.cellForRow(at: indexPath) as? ViewController22_TableViewCell
        selectedRow = indexPath.row
        btnAddUpdate.setTitle("Update", for: .normal)
        btnClear.isHidden = false
        //let isSelected = cell?.isSelected ?? false
            
        tfName.text = cell?.lblName.text
        tfAge.text = cell?.lblAge.text
 
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayItem.remove(at: indexPath.row)
            tbvData.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let insert = UIContextualAction(style: .normal, title: "Insert") { (action, sourceView, completionHandler) in
            print("index path of insert: \(indexPath)")
            completionHandler(true)
        }
        
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [insert])
        swipeActionConfig.performsFirstActionWithFullSwipe = true
        return swipeActionConfig
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            print("index path of delete: \(indexPath)")
            completionHandler(true)
        }
        
        let rename = UIContextualAction(style: .normal, title: "Rename") { (action, sourceView, completionHandler) in
            print("index path of delete: \(indexPath)")
            completionHandler(true)
        }
        
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [rename,delete])
        swipeActionConfig.performsFirstActionWithFullSwipe = true
        return swipeActionConfig
    }
    
    
}
