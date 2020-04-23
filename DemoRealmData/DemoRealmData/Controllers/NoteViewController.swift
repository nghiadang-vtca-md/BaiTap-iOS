//
//  NoteViewController.swift
//  DemoRealmData
//
//  Created by nghiadang1205 on 3/11/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var noteTextView: UITextView!
    
    var noteObject: Note?
    
    var notebookObject: Notebook! {
        didSet {
            self.configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }
    
    func configureView() {
        if noteObject == nil {
            self.navigationItem.title = "New Note"
        } else {
            if let content = noteObject?.content {
                noteTextView.text = content
                self.navigationItem.title = "Edit note"
            }
        }
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - IBActions
    @IBAction func saveNote(_ sender: Any) {
        if noteObject == nil { // Create new note
            NotesManager.shared.addNote(notebookObject, content: noteTextView.text)
        } else {
            NotesManager.shared.updateNote(note: noteObject!, newContent: noteTextView.text)
        }
    }

}
