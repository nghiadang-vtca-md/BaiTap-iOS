//
//  ContactsDataSource.swift
//  ContactApp
//
//  Created by nghiadang1205 on 2/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation
import UIKit

class ContactsDataSource: NSObject, UITableViewDataSource {
    private var sectionedData: [[Contact]]
    let sectionTitles: [String]
    
    init(sectionedData: [[Contact]], sectionTitles: [String]) {
        self.sectionedData = sectionedData
        self.sectionTitles = sectionTitles
        super.init()
    }
    
    //MARK: - Data source
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionedData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // default cell
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = sections[indexPath.section][indexPath.row]
        cell.textLabel?.text = contact.firstName
        cell.imageView?.image = contact.image
        cell.detailTextLabel?.text = contact.lastName
         */
            // Custom cell thì phải tạo một file CocoaTouch UITableViewCell mới để kéo outlet và gán Class cho Cell ở ngoài giao diện
        guard let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else {
            fatalError()
        }
        
        let contact = sectionedData[indexPath.section][indexPath.row]
        
        contactCell.profileImageView.image = contact.image
        contactCell.nameLabel.text = contact.firstName
        contactCell.cityLabel.text = contact.city
        if contact.isFavorite {
            contactCell.favoriteIcon.image = UIImage(named: "Star")
        } else {
            contactCell.favoriteIcon.image = nil
        }
        
        return contactCell
    }
    
    // MARK: - Helper Methods
    func object(at indexPath: IndexPath) -> Contact {
        return sectionedData[indexPath.section][indexPath.row]
    }

    func indexPath(for contact: Contact) -> IndexPath? {
        for (index, contacts) in sectionedData.enumerated() {
            if let indexOfContact = contacts.firstIndex(of: contact) {
                return IndexPath(row: indexOfContact, section: index)
            }
        }
        return nil
    }

    func updateContact(_ contact: Contact, at indexPath: IndexPath) {
        sectionedData[indexPath.section][indexPath.row] = contact
    }
    
}
