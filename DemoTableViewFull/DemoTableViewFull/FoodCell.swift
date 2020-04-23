//
//  FoodCell.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class FoodCell: UICollectionViewCell {
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        //self.contentView.backgroundColor = .cyan
        self.contentView.layer.borderWidth = 3.0
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    func config(with food: Food) {
        imageV.image = food.image
        titleLabel.text = food.title
    }
}
