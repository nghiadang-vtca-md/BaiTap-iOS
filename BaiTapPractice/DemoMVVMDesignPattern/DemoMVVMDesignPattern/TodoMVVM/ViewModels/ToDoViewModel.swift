//
//  ToDoViewModel.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

class ToDoViewModel {
    private var todos: [ToDo]
    
    var count: Int {
        return todos.count
    }
    
    init() {
        todos = [ToDo]()
        //addDummyData()
    }
    
    private func addDummyData() {
        for i in 0...19 {
            todos.append(ToDo(task: "Task \(i)", completed: false, notes: "This is sample todo list task"))
        }
    }
    
    func itemAt(index: Int) -> ToDo {
        return todos[index]
    }
    
    func updateCompletedState(index: Int, newValue: Bool) {
        todos[index].completed = newValue
    }
    
    func addNew(todo: ToDo) {
        todos.append(todo)
    }
    
}
