//
//  NoteTableViewController.swift
//  DemoRealmData
//
//  Created by nghiadang1205 on 3/11/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import RealmSwift

class NoteTableViewController: UITableViewController {
    
    var notebookObject: Notebook? {
        didSet {
            self.configureView()
        }
    }
    
    var notesArray = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func configureView() {
        self.navigationItem.title = notebookObject?.title
        loadData()
    }
    
    func loadData() {
        if let notebook = notebookObject {
            if let notes = NotesManager.shared.getNotes(notebook: notebook) {
                notesArray = notes
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        let note = notesArray[indexPath.row]
        
        cell.textLabel?.text = note.content
        
        return cell
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let noteVC = segue.destination as? NoteViewController {
            print(notebookObject!)
            noteVC.notebookObject = self.notebookObject
            //noteVC.navigationController?.navigationItem.largeTitleDisplayMode = .never
            
            if segue.identifier == "showNote" {
                if let selectedNoteIndexPath = self.tableView.indexPathForSelectedRow {
                    let noteObject = notesArray[selectedNoteIndexPath.row]
                    noteVC.noteObject = noteObject
//                    self.tableView.deselectRow(at: selectedNoteIndexPath, animated: true)
                }
            }
        }
    }
    
    // MARK: TableViewDelegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteObjectToDelete = notesArray[indexPath.row]
            NotesManager.shared.deleteNote(noteObjectToDelete)
            notesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.present(NoteViewController(), animated: true, completion: nil)
//    }
    

}
