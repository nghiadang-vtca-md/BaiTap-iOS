//
//  ListNote.swift
//  BaiTap5
//
//  Created by user159518 on 1/13/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import Foundation

class ListNote {
    var notes: [Note] = []
     let userDefault = UserDefaults.standard

    func addNew(note: Note) {
        notes.append(note)

        let structToDataJSON = try! JSONEncoder().encode(notes)
        userDefault.set(structToDataJSON, forKey: "valueTypeStruct")
        
    }
    
    func edit(note: Note) {
        //notes.append(note)
        
        for (index,noteOfList) in notes.enumerated() {
            if noteOfList.id == note.id {
//                notes.remove(at: index)
//                notes.insert(note, at: index)
                notes[index] = note
                userDefault.removeObject(forKey: "valueTypeStruct")
                let structToDataJSON = try! JSONEncoder().encode(notes)
                userDefault.set(structToDataJSON, forKey: "valueTypeStruct")
            }
        }
    }
    
    func remove(noteID: String) {
        for (index,note) in notes.enumerated() {
            if note.id == noteID {
                notes.remove(at: index)
                userDefault.removeObject(forKey: "valueTypeStruct")
                let structToDataJSON = try! JSONEncoder().encode(notes)
                userDefault.set(structToDataJSON, forKey: "valueTypeStruct")
            }
        }
    }
    
    func loadAllNotes() {
        if let value6 = userDefault.value(forKey: "valueTypeStruct") as? Data {
            let dataToStruct = try! JSONDecoder().decode([Note].self, from: value6)
            self.notes = dataToStruct
        }
    }
}
