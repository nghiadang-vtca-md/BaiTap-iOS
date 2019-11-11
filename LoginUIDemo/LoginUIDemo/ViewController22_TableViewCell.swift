//
//  ViewController22_TableViewCell.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/11/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController22_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNumberOrdinal: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func visualizeCell(item: PersonalInfo) {
        lblNumberOrdinal.text = item.number
        lblName.text = item.name
        lblAge.text = "\(item.age)"
    }

}
