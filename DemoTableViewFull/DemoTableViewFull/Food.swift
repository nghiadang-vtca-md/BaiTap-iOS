//
//  Food.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/16/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class Food {
    var title: String
    var subtitle: String
    var image: UIImage
    var fullImage: UIImage
    
    init(title: String, subtitle: String, image: UIImage, fullImage: UIImage) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.fullImage = fullImage
    }
}
