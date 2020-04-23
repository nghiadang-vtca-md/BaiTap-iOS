//
//  TapGesture.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/21/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class TapGesture: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check vào user interaction enable
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(onTapImage))
        imageV.addGestureRecognizer(imageGesture)
        imageGesture.numberOfTapsRequired = 2
        
        // Check vào user interaction enable
        let labelGesture = UITapGestureRecognizer(target: self, action: #selector(onTapLabel))
        labelText.addGestureRecognizer(labelGesture)
        
        let viewlGesture = UITapGestureRecognizer(target: self, action: #selector(onTapView))
        self.view.addGestureRecognizer(viewlGesture)
    }
    
    @objc func onTapImage() {
        labelText.text = "Image Tapped"
    }
    
    @objc func onTapLabel() {
        labelText.text = "Label Tapped"
    }
    
    @objc func onTapView() {
        labelText.text = "View Tapped"
    }
    

}
