//
//  AddNewToDoViewModel.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

class AddNewToDoViewModel {
    private var todoItem: ToDo?
    
    var newTodo: ToDo? {
        get {
            return todoItem
        }
        set {
            todoItem = newValue
        }
    }
}
