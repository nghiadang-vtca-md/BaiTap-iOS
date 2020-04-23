//
//  CustomCell.swift
//  DemoCollectionView
//
//  Created by nghiadang1205 on 2/12/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var selectLabel: UILabel!
    var isEditing: Bool = false {
        didSet {
            selectLabel.isHidden = !isEditing
        }
    }
    override var isSelected: Bool { // biến này có sẵn trong UICollectionViewCell
        didSet {
            if isEditing {
                selectLabel.text = isSelected ? "✓" : ""
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectLabel.layer.cornerRadius = 15
        self.selectLabel.layer.masksToBounds = true
        self.selectLabel.layer.borderColor = UIColor.white.cgColor
        self.selectLabel.layer.borderWidth = 1.0
        self.selectLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectLabel.isHidden = !isEditing
    }
}
