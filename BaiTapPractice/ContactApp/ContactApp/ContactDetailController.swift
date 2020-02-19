//
//  ContactDetailController.swift
//  ContactApp
//
//  Created by nghiadang1205 on 2/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

protocol ContactDetailControllerDelegate: class {
    func didMarkAsFavoriteContact(_ contact: Contact)
}

class ContactDetailController: UITableViewController {

    var contact: Contact?

    // Outlets
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    
    weak var delegate: ContactDetailControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configureView() {
        guard let contact = contact else {
            return
        }
        profileView.image = contact.image
        nameLabel.text = "\(contact.firstName) \(contact.lastName)"
        phoneNumberLabel.text = contact.phone
        emailLabel.text = contact.email
        streetAddressLabel.text = contact.street
        cityLabel.text = contact.city
        stateLabel.text = contact.state
        zipLabel.text = contact.zip
    }
    
    // MARK: - Actions
    @IBAction func markAsFavorite(_ sender: UIButton) {
        guard let contact = contact else {
            return
        }
        delegate?.didMarkAsFavoriteContact(contact)
    }
    

}
