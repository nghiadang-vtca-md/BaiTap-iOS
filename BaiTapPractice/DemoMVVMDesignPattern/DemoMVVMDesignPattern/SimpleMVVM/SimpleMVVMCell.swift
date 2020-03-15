//
//  SimpleMVVMCell.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class SimpleMVVMCell: UITableViewCell {
    
    var data: SimpleModel? {
        didSet {
            if let data = data {
                colorView.backgroundColor = data.color
                baseView.backgroundColor = data.color.withAlphaComponent(0.5)
                colorName.text = data.text
            }
        }
    }
    
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var colorName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
        colorView.layer.cornerRadius = 40 // chia đôi để thành hình tròn ?
        colorView.layer.masksToBounds = true
        baseView.layer.cornerRadius = 40
        baseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
