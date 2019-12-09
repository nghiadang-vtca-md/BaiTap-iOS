//
//  tbvCell.swift
//  ListAddApp
//
//  Created by iMac_VTCA on 12/9/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class tbvCell: UITableViewCell, Cell {

    
    @IBOutlet weak var tfTitle: UILabel!
    @IBOutlet weak var tfDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
