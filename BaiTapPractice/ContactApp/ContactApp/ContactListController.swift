//
//  ContactListController.swift
//  ContactApp
//
//  Created by nghiadang1205 on 2/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

extension Contact {
    var firstLetterForSort: String {
        return String(firstName.first!).uppercased()
    }
}

extension ContactsSource {
    static var sortedUniqueFirstLetters: [String] {
        let firstLetters = contacts.map { $0.firstLetterForSort }
        let uniqueFirstLetters = Set(firstLetters)
        return Array(uniqueFirstLetters).sorted()
    }
    static var sectionedContacts: [[Contact]] {
        return sortedUniqueFirstLetters.map { firstLetter in
            let filteredContacts = contacts.filter { $0.firstLetterForSort == firstLetter }
            return filteredContacts.sorted(by: { $0.firstName < $1.firstName })
        }
    }
}

class ContactListController: UITableViewController {
    // Cách 1: bình thường
    /*
    var contacts = ContactsSource.contacts
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.firstName
        cell.imageView?.image = contact.image
        cell.detailTextLabel?.text = contact.lastName
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContact" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let contact = contacts[indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController, let contactDetailController = navigationController.topViewController as? ContactDetailController else { return }
                
                contactDetailController.contact = contact
            }
        }
    }
    */
    // end Cách 1:
    
    // Cách 2: phân loại sắp xếp theo chữ cái trong danh bạ
//    var sections = ContactsSource.sectionedContacts
//    let sectionTitles = ContactsSource.sortedUniqueFirstLetters // refactor code for dataSource
    
    let dataSource = ContactsDataSource(sectionedData: ContactsSource.sectionedContacts, sectionTitles: ContactsSource.sortedUniqueFirstLetters)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource // ghi đè lên self
    }

    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContact" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let contact = dataSource.object(at: indexPath)
                
                guard let navigationController = segue.destination as? UINavigationController, let contactDetailController = navigationController.topViewController as? ContactDetailController else { return }
                
                contactDetailController.contact = contact
                contactDetailController.delegate = self
            }
        }
    }
    
    // MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // end Cách 2:
    
}

extension Contact: Equatable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.street == rhs.street && lhs.city == rhs.city && lhs.state == rhs.state && lhs.zip == rhs.zip && lhs.phone == rhs.phone && lhs.email == rhs.email
    }
}

extension ContactListController: ContactDetailControllerDelegate {
    func didMarkAsFavoriteContact(_ contact: Contact) {
        guard let indexPath = dataSource.indexPath(for: contact) else {
            return
        }
        
        var favoriteContact = dataSource.object(at: indexPath)
        favoriteContact.isFavorite = true
        
        dataSource.updateContact(favoriteContact, at: indexPath)
        
        tableView.reloadData()


    }


}
