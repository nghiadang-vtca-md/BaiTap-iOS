//
//  ViewController20_CustomViewCellTableViewCell.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/6/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController20_CustomViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnChoose: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        // hàm này giải quyết vấn đề - khi nhiều dữ liệu nếu không xoá dữ liệu cũ sẽ load đè không kịp
        // giải pháp là gán lại bằng nil tất cả
        lblName.text = nil
        lblDescription.text = nil
        imgView.image = nil
    }
    
    func visualizeCell(item: FruitItem) {
        lblName.text = item.name
        lblDescription.text = item.description
        imgView.image = UIImage(named: item.image)
    }

}
