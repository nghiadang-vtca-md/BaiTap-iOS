//
//  VendingItemCell.swift
//  VendingMachine
//
//  Created by nghiadang1205 on 3/5/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class VendingItemCell: UICollectionViewCell {
    @IBOutlet weak var iconView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentView.backgroundColor = UIColor(named: "blackFadeCustom")
    }
}
