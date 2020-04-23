//
//  Note.swift
//  DemoRealmData
//
//  Created by nghiadang1205 on 3/11/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var creationDate = Date()
    @objc dynamic var content = ""
    
    //let notebook = LinkingObjects(fromType: Notebook.self, property: "notes")
}

class Notebook: Object {
    @objc dynamic var title = ""
    @objc dynamic var creationDate = Date()
    
    let notes = List<Note>()
}
