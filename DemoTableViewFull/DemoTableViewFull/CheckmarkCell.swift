//
//  CheckmarkCell.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/30/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class CheckmarkCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCheckmark: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
