//
//  CustomTableViewCell.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/17/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    func setCell(food: Food) {
        self.title.text = food.title
        self.subtitle.text = food.subtitle
        self.imageV.image = food.image
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
