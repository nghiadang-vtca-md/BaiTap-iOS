//
//  ViewController.swift
//  DemoUsingSQLite
//
//  Created by iMac_VTCA on 1/13/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    // tạo một biến pointer để check
    var db: OpaquePointer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let fileURL = try! FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("my_database.db") else {
            return
        }
        print(fileURL)
        // open db
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
            return
        }
        
        // create table
        let createStatement = "CREATE TABLE IF NOT EXISTS User (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)"
        
        if sqlite3_exec(db, createStatement, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("Error create table: \(errmsg)")
            return
        }
        
        let createStatement2 = "CREATE TABLE IF NOT EXISTS User2 (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)"
        
        if sqlite3_exec(db, createStatement2, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("Error create table2: \(errmsg)")
            return
        }
        
    }
    
    @IBAction func addButton_Clicked(_ sender: UIButton) {
        addValue()
    }
    
    @IBAction func readButton_Clicked(_ sender: UIButton) {
        readValue()
    }
    
    @IBAction func deleteButton_Clicked(_ sender: UIButton) {
        deleteValue(id: 6)
    }
    
    @IBAction func readOneRow(_ sender: UIButton) {
        readOneRow(id: 10)
    }
    
    @IBAction func editRow_Clicked(_ sender: UIButton) {
        editValue(id: 5, name: "nhi", age: 20)
    }
    
    
    func addValue() {
        var stmt: OpaquePointer?
        // query
        let queryString = "INSERT INTO USER (name, age) VALUES(?,?)"
        
        
        
        if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("Error create pointer: \(errmsg)")
            return
        }
        
        let name: NSString = "nghia"
        let age = 23
        
        if sqlite3_bind_text(stmt, 1, name.utf8String, -1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("Error binding name of user: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 2, Int32(age)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("Error binding age of user: \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("Error insert user: \(errmsg)")
            return
        }
    }
    
    func readOneRow(id: Int) {
        var stmt: OpaquePointer?
        if sqlite3_prepare(db, "SELECT id,name,age from User where id = \'\(id)\'", -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure preparing select: \(errmsg)")
            return
        } else {
            sqlite3_step(stmt)
            let idOfCurrentPointer = sqlite3_column_int64(stmt, 0)
            if idOfCurrentPointer == id {
                
                let id = sqlite3_column_int64(stmt, 0)
                print("id = \(id);", terminator: " ")
                
                if let cStringName = sqlite3_column_text(stmt, 1) {
                    let name = String(cString: cStringName)
                    print("name = \(name);", terminator: " ")
                    
                } else {
                    print("name was not found")
                }
                
                let age = sqlite3_column_int(stmt, 2)
                print("age = \(age);")
               
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db))
                    print("Error insert user: \(errmsg)")
                    return
                }
                print("Read id \"\(id)\" successfully")
            } else {
                print("id was not found.")
            }
        }
    }
    
    func readValue() {
        var stmt: OpaquePointer?
        
        // get database
        if sqlite3_prepare(db, "SELECT id,name,age from User", -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure preparing select: \(errmsg)")
            return
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = sqlite3_column_int64(stmt, 0)
            print("id = \(id);", terminator: " ")
            
            if let cStringName = sqlite3_column_text(stmt, 1) {
                let name = String(cString: cStringName)
                print("name = \(name);", terminator: " ")
                
            } else {
                print("name was not found")
            }
            
            let age = sqlite3_column_int(stmt, 2)
            print("age = \(age);")
        }
    }
    
    func editValue(id: Int, name: String, age: Int) {
        var stmt: OpaquePointer?
        if sqlite3_prepare(db, "SELECT id,name,age from User where id = \'\(id)\'", -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure preparing select: \(errmsg)")
            return
        } else {
            sqlite3_step(stmt)
            let idOfCurrentPointer = sqlite3_column_int64(stmt, 0)
            if idOfCurrentPointer == id {
                if sqlite3_prepare(db, "UPDATE User SET name = \'\(name)\', age = \'\(age)\' where id = \'\(id)\'", -1, &stmt, nil) != SQLITE_OK {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("Failure preparing delete: \(errmsg)")
                    return
                }
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let errmsg = String(cString: sqlite3_errmsg(db))
                    print("Error insert user: \(errmsg)")
                    return
                }
                print("Update successfully")
            } else {
                print("id was not found.")
            }
        }
    }
    
    func deleteValue(id: Int64) {
            var stmt: OpaquePointer?
            
    //        if sqlite3_prepare(db, "DELETE from User where id = \'\(id)\'", -1, &stmt, nil) != SQLITE_OK {
    //            let errmsg = String(cString: sqlite3_errmsg(db)!)
    //            print("Failure preparing delete: \(errmsg)")
    //            return
    //        }
    //        if sqlite3_step(stmt) != SQLITE_DONE {
    //            let errmsg = String(cString: sqlite3_errmsg(db))
    //            print("Error insert user: \(errmsg)")
    //            return
    //        }
    //        print("Delete successfully")
            
            if sqlite3_prepare(db, "SELECT id,name,age from User where id = \'\(id)\'", -1, &stmt, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("Failure preparing select: \(errmsg)")
                return
            } else {
                sqlite3_step(stmt)
                let idOfCurrentPointer = sqlite3_column_int64(stmt, 0)
                if idOfCurrentPointer == id {
                    if sqlite3_prepare(db, "DELETE from User where id = \'\(id)\'", -1, &stmt, nil) != SQLITE_OK {
                        let errmsg = String(cString: sqlite3_errmsg(db)!)
                        print("Failure preparing delete: \(errmsg)")
                        return
                    }
                    if sqlite3_step(stmt) != SQLITE_DONE {
                        let errmsg = String(cString: sqlite3_errmsg(db))
                        print("Error insert user: \(errmsg)")
                        return
                    }
                    print("Delete successfully")
                } else {
                    print("id was not found.")
                }
            }
        }
    
    
    
    
    

}

/*
 tải library: 'sqlite3.0.tbd
 import SQLite3
 */

