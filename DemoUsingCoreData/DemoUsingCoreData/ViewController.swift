//
//  ViewController.swift
//  DemoUsingCoreData
//
//  Created by iMac_VTCA on 1/15/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadAllPersonInfo()
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        loadAllPersonInfo()
//    }

    @IBAction func addButton_Clicked(_ sender: UIButton) {
        let firstName = tfFirstName.text ?? ""
        let lastName = tfLastName.text ?? ""
        
        if firstName.isEmpty || lastName.isEmpty {
            return
        }
        saveInfo(firstName: firstName, lastName: lastName)
    }
    
    func saveInfo(firstName: String, lastName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "PersonInfo", in: manageContext) else {
            return
        }
        
        let person = NSManagedObject(entity: entity, insertInto: manageContext)
        
        person.setValue(firstName, forKeyPath: "firstName")
        person.setValue(lastName, forKeyPath: "lastName")
        
        appDelegate.saveContext()
        
    }
    
    
    @IBAction func loadAllPerson_Clicked(_ sender: UIButton) {
        loadAllPersonInfo()
    }
    
    
    @IBAction func updatePerson_Clicked(_ sender: UIButton) {
        updatePersonInfo()
    }
    
    
    @IBAction func deletePerson_Clicked(_ sender: UIButton) {
        deletePerson()
    }
    
    func deletePerson() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        // string ~ @ ; int ~ i
        let predicate = NSPredicate(format: "firstName = %@", "person4")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
        // same as the filter
        fetchRequest.predicate = predicate
        //
        do {
            let persons = try manageContext.fetch(fetchRequest)
            if let deleteObject = persons.first {
                manageContext.delete(deleteObject)
                appDelegate.saveContext()
            }
        } catch {
            print("Error updatePersonInfo: \(error.localizedDescription)")
        }
    }
    
    func updatePersonInfo() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        // string ~ @ ; int ~ i
        let predicate = NSPredicate(format: "firstName = %@ AND lastName = %@", "person2", "person2")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
        // same as the filter
        fetchRequest.predicate = predicate
        //
        do {
            let persons = try manageContext.fetch(fetchRequest)
//            for person in persons {
//                let firstName = person.value(forKey: "firstName") as? String ?? ""
//                let lastName = person.value(forKey: "lastName") as? String ?? ""
//                print("\(firstName) \(lastName)")
//            }
            let updateObject = persons.first
            updateObject?.setValue("person4", forKeyPath: "firstName")
            updateObject?.setValue("person4", forKeyPath: "lastName")
            appDelegate.saveContext()
        } catch {
            print("Error updatePersonInfo: \(error.localizedDescription)")
        }
    }
    
    func loadAllPersonInfo() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
        
        do {
            let persons = try manageContext.fetch(fetchRequest)
            for person in persons {
                let firstName = person.value(forKey: "firstName") as? String ?? ""
                let lastName = person.value(forKey: "lastName") as? String ?? ""
                print("\(firstName) \(lastName)")
            }
        } catch {
            print("Error loadAllPersonInfo: \(error.localizedDescription)")
        }
    }
    
}

