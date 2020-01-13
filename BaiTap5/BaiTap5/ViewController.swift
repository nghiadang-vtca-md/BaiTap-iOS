//
//  ViewController.swift
//  BaiTap5
//
//  Created by iMac_VTCA on 1/10/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Cell {
    
    @IBOutlet weak var notesTableView: UITableView!
    var listNote = ListNote()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notesTableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToNoteDetail") {
            let viewController2 = segue.destination as! ViewController2
            viewController2.delegate = self
        }
    }

}

extension ViewController: crudDelegate {
    func saveItem(note: Note) {
        listNote.addNew(note: note)
        print(listNote.notes)
        notesTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNote.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myNoteCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = listNote.notes[indexPath.row].title
        cell.detailTextLabel?.text = listNote.notes[indexPath.row].dateCreated
        
        return cell
    }
    
    
}

// Note App

