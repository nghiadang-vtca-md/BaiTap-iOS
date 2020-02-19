//
//  CoreDataStack.swift
//  ToDoList
//
//  Created by nghiadang1205 on 2/14/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
//    private(set) lazy var applicationDocumentsDirectory: URL = {
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        let endIndex = urls.index(before: urls.endIndex)
//        print(urls[endIndex])
//        return urls[endIndex]
//    }()
//
//    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
//        let modelUrl = Bundle.main.url(forResource: "ToDoList", withExtension: "momd")!
//
//        return NSManagedObjectModel(contentsOf: modelUrl)!
//    }()
//
//    private(set) lazy var persistenceStoreCoordinator: NSPersistentStoreCoordinator = {
//        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//        let url = self.applicationDocumentsDirectory.appendingPathComponent("ToDoList.sqlite")
//        do {
//            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url)
//        } catch {
//            print(error)
//            abort()
//        }
//
//        return coordinator
//    }()
//
//    lazy var managedObjectContext: NSManagedObjectContext = {
//        let coordinator = self.persistenceStoreCoordinator
//        let moc = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
//        moc.persistentStoreCoordinator = coordinator
//        return moc
//    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let container  = self.persistentContainer
        return container.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}

extension NSManagedObjectContext {
    func saveChanges() {
        if self.hasChanges {
            do {
                try save()
            } catch  {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
