//
//  AppDelegate.swift
//  DemoRealmData
//
//  Created by nghiadang1205 on 2/28/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //let realm = try! Realm()
        
        /*
         class Note: Object {
             @objc dynamic var title = ""
             @objc dynamic var content = ""
             
             let notebook = LinkingObjects(fromType: Notebook.self, property: "notes")
         }

         class Notebook: Object {
             @objc dynamic var title = ""
             @objc dynamic var creationDate = Date()
             
             let notes = List<Note>()
         }
         */
        
        // Debug: po NSHomeDirectory() to get file path Realm
        
//        let myFirstNote = Note()
//        myFirstNote.title = "My third note"
//        myFirstNote.content = "This is my third note. This is really marvelous!"
//        do {
//            try realm.write {
//                realm.add(myFirstNote)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
        
//        print(realm.objects(Note.self))
        
        //let allMyNotes = realm.objects(Note.self)
        
        // filter demo
//        let filterNotes = allMyNotes.filter("title CONTAINS 'second'")
//        print(filterNotes)
//
//        let complexFilterPredicate = NSPredicate(format: "title CONTAINS %@ AND content CONTAINS %@", "My", "amazing")
//        let filterNotes2 = allMyNotes.filter(complexFilterPredicate)
//        print(filterNotes2)
        
        // update demo
//        if let firstNote = allMyNotes.first {
//            try! realm.write {
//                firstNote.title = "Demo No.0"
//                firstNote.content = "This is a update demo"
//            }
//        }
//
//        for note in allMyNotes {
//            print("Note title: \(note.title)" + "\n" + "Note content: \(note.content)" + "\n ================")
//        }
        
        // delete demo
//        if let firstNote = allMyNotes.first {
//            try! realm.write {
//                realm.delete(firstNote)
//            }
//        }
        
        // relationship demo
        //createNotebook("My second notebook")
        
        
        return true
    }
    // MARK: - Demo relationship Realm Database
//    func createNotebook(_ title: String) {
//        let realm = try! Realm()
//        
//        let notebook = Notebook()
//        notebook.title = title
//        notebook.creationDate = Date()
//        
//        try! realm.write {
//            realm.add(notebook)
//        }
//        
//        addNotebook(notebook)
//    }
//    
//    func addNotebook(_ notebook: Notebook) {
//        
//        let realm = try! Realm()
//        
//        for i in 1...5 {
//            let note = Note()
//            note.title = "Note \(i)"
//            note.content = "\(Date())"
//            
//            try! realm.write {
//                notebook.notes.append(note)
//            }
//        }
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

