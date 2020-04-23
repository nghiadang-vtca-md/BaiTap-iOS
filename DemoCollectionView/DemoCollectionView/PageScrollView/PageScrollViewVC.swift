//
//  PageScrollViewVC.swift
//  DemoCollectionView
//
//  Created by nghiadang1205 on 3/20/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class PageScrollViewVC: UIViewController {
    
    var pages: [View] {
        get {
            let page1: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page1.view.backgroundColor = UIColor.blue
            page1.label.text = "Blue"
            
            let page2: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page2.view.backgroundColor = UIColor.green
            page2.label.text = "Green"
            
            let page3: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page3.view.backgroundColor = UIColor.gray
            page3.label.text = "Gray"
            
            let page4: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page4.view.backgroundColor = UIColor.yellow
            page4.label.text = "Yellow"
            
            let page5: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page5.view.backgroundColor = UIColor.purple
            page5.label.text = "Purple"
            
            return [page1, page2, page3, page4, page5]
        }
    }

    
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var segment: UISegmentedControl!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        upView.bringSubviewToFront(pageControl)
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        setupScrollView(pages: pages)
        
        // Segment swipe
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        self.downView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.direction = .left
        self.downView.addGestureRecognizer(swipeLeft)
        //
    }
    
    @objc func swipedRight() {
        segment.selectedSegmentIndex -= 1
    }
    
    @objc func swipedLeft() {
        segment.selectedSegmentIndex += 1
    }

    
    func setupScrollView(pages: [View]) {
        let frameUpView = upView.frame
        scrollView.frame = CGRect(x: 0, y: 0, width: frameUpView.width, height: frameUpView.height)
        scrollView.contentSize = CGSize(width: frameUpView.width * CGFloat(pages.count), height: frameUpView.height)
        scrollView.isPagingEnabled = true
        
        for i in 0..<pages.count {
            pages[i].frame = CGRect(x: frameUpView.width * CGFloat(i), y: 0, width: frameUpView.width, height: frameUpView.height)
            scrollView.addSubview(pages[i])
        }
    }
    
    
    
}

extension PageScrollViewVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 111 {
            let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
            pageControl.currentPage = Int(pageIndex)
        }
    }
}


