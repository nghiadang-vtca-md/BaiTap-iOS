//
//  ContactCell.swift
//  ContactApp
//
//  Created by nghiadang1205 on 2/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    // outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
