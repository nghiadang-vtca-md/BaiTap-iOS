//
//  Item+CoreDataProperties.swift
//  ToDoList
//
//  Created by nghiadang1205 on 2/15/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
        
        return request
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var text: String

}
