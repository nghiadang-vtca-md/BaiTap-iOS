//
//  HelperFunctions.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/23/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

// MARK: GLOBAL FUNCTIONS
private let dateFormat = "yyyyMMddHHmmss"

func dateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    
    dateFormatter.timeZone = TimeZone(secondsFromGMT: TimeZone.current.secondsFromGMT())
    dateFormatter.dateFormat = dateFormat
    
    return dateFormatter
}

func imageFromInitials(firstName: String?, lastName: String?, withBlocks: @escaping (_ image: UIImage) -> Void) {
    var string: String!
    var size = 36
    
    if firstName != nil && lastName != nil {
        string = String(firstName!.first!).uppercased() + String(lastName!.first!).uppercased()
    } else {
        string = String(firstName!.first!).uppercased()
        size = 72
    }
    
    let lblNameInitialize = UILabel()
    lblNameInitialize.frame.size = CGSize(width: 100, height: 100)
    lblNameInitialize.textColor = .white
    lblNameInitialize.font = UIFont(name: lblNameInitialize.font.fontName, size: CGFloat(size))
    lblNameInitialize.text = string
    lblNameInitialize.textAlignment = NSTextAlignment.center
    lblNameInitialize.backgroundColor = UIColor.lightGray
    lblNameInitialize.layer.cornerRadius = 25
    
    UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
    lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
    
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    withBlocks(img!)    
}
