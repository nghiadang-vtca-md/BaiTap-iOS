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
    


}

/*
 tải library: 'sqlite3.0.tbd
 import SQLite3
 */

