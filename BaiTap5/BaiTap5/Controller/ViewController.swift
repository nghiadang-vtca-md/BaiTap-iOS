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
    var selectedNote: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.dataSource = self
        notesTableView.delegate = self
        
        // Do any additional setup after loading the view.
        //        let userDefault = UserDefaults.standard
        //        userDefault.removeObject(forKey: "valueTypeStruct")
        listNote.loadAllNotes()
        notesTableView.reloadData()
        
    }
    
    @IBAction func addNewButton_Clicked(_ sender: UIButton) {
        self.selectedNote = nil
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if(segue.identifier == "goToNoteDetail") {
        if let viewController2 = segue.destination as? ViewController2{
            viewController2.delegate = self
            viewController2.selectedNoteToEdit = selectedNote
        }
    }
    
}

extension ViewController: crudDelegate {
    func saveItem(note: Note) {
        if self.selectedNote == nil {
            listNote.addNew(note: note)
            print(listNote.notes)
            notesTableView.reloadData()
        } else {
            listNote.edit(note: note)
            print(listNote.notes)
            notesTableView.reloadData()
        }
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedNote = listNote.notes[indexPath.row]
        notesTableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToNoteDetail", sender: nil)
    }
}

// Note App

