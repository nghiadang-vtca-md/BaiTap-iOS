//
//  CustomCell.swift
//  BookSeat
//
//  Created by user159518 on 12/4/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // giải pháp hình không scale theo số đo mới của cell
    // https://stackoverflow.com/questions/57184502/systemlayoutsizefittingsize-not-called-on-ios-13
    func getCellSize(_ targetSize: CGSize) -> CGSize {
        return CGSize(width: targetSize.width, height: targetSize.height)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return self.getCellSize(targetSize)
    }

}
