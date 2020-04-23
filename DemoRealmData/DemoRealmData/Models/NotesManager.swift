//
//  NotesManager.swift
//  DemoRealmData
//
//  Created by nghiadang1205 on 3/11/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import RealmSwift

class NotesManager: NSObject {
    static let shared = NotesManager()
    
    private override init() {
        super.init()
    }
    
    func addNotebook(_ title: String) {
        let realm = try! Realm()
        
        let notebook = Notebook()
        notebook.title = title
        notebook.creationDate = Date()
        
        do {
            try realm.write {
                realm.add(notebook)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getNotebooks() -> [Notebook]? {
        let realm = try! Realm()
        let notebooks = realm.objects(Notebook.self)
        
        return notebooks.map { $0 }
    }
    
    func addNote(_ notebook: Notebook, content contentString: String) {
        let realm = try! Realm()
        
        let note = Note()
        note.content = contentString
        note.creationDate = Date()
        
        do {
            try realm.write{
                notebook.notes.append(note)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getNotes(notebook: Notebook) -> [Note]? {
        let notes = notebook.notes
        return notes.map({$0})
    }
    
    func updateNote(note: Note, newContent: String) {
        let realm = try! Realm()
        
        do {
            try realm.write{
                note.content = newContent
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteNote(_ note: Note) {
        let realm = try! Realm()
        
        do {
            try realm.write{
                realm.delete(note)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
