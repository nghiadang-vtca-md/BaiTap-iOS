//
//  DetailsTableViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/17/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    
    var food: Food?

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var subtitleText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageV.image = food?.fullImage
        titleText.text = food?.title
        subtitleText.text = food?.subtitle
    }

    
}
