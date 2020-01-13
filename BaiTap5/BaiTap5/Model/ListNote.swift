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
    
    func addNew(note: Note) {
        notes.append(note)
    }
    
    func remove(noteID: String) {
        for (index,note) in notes.enumerated() {
            if note.id == noteID {
                notes.remove(at: index)
            }
        }
    }
}
