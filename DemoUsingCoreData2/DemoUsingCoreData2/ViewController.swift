//
//  ViewController.swift
//  DemoUsingCoreData2
//
//  Created by nghiadang1205 on 2/24/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import CoreData

struct Person2 {
    let name: String
    let age: Int
}

class ViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet weak var tableViewPerson: UITableView!
    
    
    // MARK: - Variables
    var listPerson: [Person2] = [Person2]()
    
    
    // MARK: - initial load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewPerson.dataSource = self
        tableViewPerson.delegate = self
        
        saveInfo(name: "nghia", age: 24)
        saveInfo(name: "nhi", age: 20)
        loadAllPerson()
    }
    
    // MARK: - IBActions
    @IBAction func addButton_Clicked(_ sender: UIButton) {
        promptForAdd()
    }
    @IBAction func deleteButton_Clicked(_ sender: UIButton) {
        deleteAge()
    }
    
    // MARK: Prompt popups ( add - delete - update )
    
    func promptForAdd() {
        let ac = UIAlertController(title: "Add new person", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addTextField()

        let addAction = UIAlertAction(title: "Add", style: .default) { [unowned ac] _ in
            let nameField = ac.textFields![0]
            let ageField = ac.textFields![1]
            if let name = nameField.text, let ageString = ageField.text {
                if let age = Int(ageString) {
                    print("\(name) - \(age)")
                    self.saveInfo(name: name, age: Int(age))
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("cancel")
        }

        ac.addAction(addAction)
        ac.addAction(cancelAction)

        present(ac, animated: true)
    }
    
    func promptForUpdate(at indexPath: IndexPath) {
        let person = listPerson[indexPath.row]
        let ac = UIAlertController(title: "Update person", message: nil, preferredStyle: .alert)
        ac.addTextField { (nameField) in
            nameField.text = person.name
        }
        ac.addTextField{ (ageField) in
            ageField.text = "\(person.age)"
        }
        let updateAction = UIAlertAction(title: "Update", style: .default) { [unowned ac] _ in
            let nameField = ac.textFields![0]
            let ageField = ac.textFields![1]
            // do something interesting with "answer" here
            if let name = nameField.text, let ageString = ageField.text {
                if let age = Int(ageString) {
                    print("\(name) - \(age)")
                    let updatePerson = Person2(name: name, age: age)
                    self.listPerson[indexPath.row] = updatePerson
                    self.updatePerson(currentPerson: person, updatePerson: updatePerson)
                    //self.tableViewPerson.reloadData()
                }
            }
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.deletePerson(at: indexPath)
            print("delete")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("cancel")
        }

        ac.addAction(updateAction)
        ac.addAction(deleteAction)
        ac.addAction(cancelAction)

        present(ac, animated: true)
    }
    // MARK: - save - delete (1 or n) - update - loadAll
    func saveInfo(name: String, age: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Person", in: manageContext) else {
            return
        }
        
        let person = NSManagedObject(entity: entity, insertInto: manageContext)
        
        person.setValue(name, forKeyPath: "name")
        person.setValue(age, forKeyPath: "age")
        
        appDelegate.saveContext()
        loadAllPerson()
    }
    
    func updatePerson(currentPerson: Person2 ,updatePerson: Person2) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let manageContext = appDelegate.persistentContainer.viewContext
        // string ~ @ ; int ~ i
        let predicate = NSPredicate(format: "name = %@ AND age = %i", "\(String(describing: currentPerson.name))", currentPerson.age)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        // same as the filter
        fetchRequest.predicate = predicate
        //
        do {
            let persons = try manageContext.fetch(fetchRequest)
            let updateObject = persons.first
            updateObject?.setValue(updatePerson.name, forKeyPath: "name")
            updateObject?.setValue(updatePerson.age, forKeyPath: "age")
            appDelegate.saveContext()
            self.loadAllPerson()
        } catch {
            print("Error updatePersonInfo: \(error.localizedDescription)")
        }
    }
    
    func deletePerson(at indexPath: IndexPath) {
        let person = listPerson[indexPath.row]
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        // string ~ @ ; int ~ i
        let predicate = NSPredicate(format: "name = %@ AND age = %i", "\(String(describing: person.name))", person.age)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        // same as the filter
        fetchRequest.predicate = predicate
        //
        do {
            let persons = try manageContext.fetch(fetchRequest)
            if let deleteObject = persons.first {
                manageContext.delete(deleteObject)
                appDelegate.saveContext()
                self.listPerson.remove(at: indexPath.row)
                self.tableViewPerson.reloadData()
                loadAllPerson()
            }
        } catch {
            print("Error updatePersonInfo: \(error.localizedDescription)")
        }
    }
    
    func deleteAge() {
        //
        let ac = UIAlertController(title: "Delete by age", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [unowned ac] _ in
            let ageField = ac.textFields![0]
            // do something interesting with "answer" here
            if let ageString = ageField.text {
                if let age = Int(ageString) {
                    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                        return
                    }
                    
                    let manageContext = appDelegate.persistentContainer.viewContext
                    // string ~ @ ; int ~ i
                    let predicate = NSPredicate(format: "age = %i", age)
                    
                    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
                    // same as the filter
                    fetchRequest.predicate = predicate
                    //
                    do {
                        let persons = try manageContext.fetch(fetchRequest)
                        for person in persons {
                            manageContext.delete(person)
                        }
                        appDelegate.saveContext()
                        self.loadAllPerson()
                    } catch {
                        print("Error updatePersonInfo: \(error.localizedDescription)")
                    }
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("cancel")
        }
        
        ac.addAction(deleteAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
        
    }
    
    func loadAllPerson() {
        listPerson.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            let persons = try manageContext.fetch(fetchRequest)
            for person in persons {
                let name = person.value(forKey: "name") as? String ?? ""
                let age = person.value(forKey: "age") as? Int ?? 0
                let p = Person2(name: name, age: age)
                listPerson.append(p)
                print("name: \(name) - age: \(age)")
            }
            tableViewPerson.reloadData()
        } catch {
            print("Error loadAllPersonInfo: \(error.localizedDescription)")
        }
    }


}

// MARK: Extentions
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        let person = listPerson[indexPath.row]
        
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = "\(person.age)"
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.promptForUpdate(at: indexPath)
    }
}

