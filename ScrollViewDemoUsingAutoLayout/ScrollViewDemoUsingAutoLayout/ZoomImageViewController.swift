//
//  ZoomImageViewController.swift
//  ScrollViewDemoUsingAutoLayout
//
//  Created by iMac_VTCA on 12/11/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ZoomImageViewController: UIViewController {

    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
    }

}

extension ZoomImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
