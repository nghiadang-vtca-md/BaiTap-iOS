//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by iMac_VTCA on 12/11/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ScrollViewProgrammatic: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(UIScreen.main.bounds.size)
        
        createScrollView()
    }
    
    func createScrollView() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        scrollView.backgroundColor = .cyan
        
        let redView = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        redView.backgroundColor = .red
        
        let greenView = UIView(frame: CGRect(x: 150, y: 160, width: 150, height: 200))
        greenView.backgroundColor = .green
        
        let blueView = UIView(frame: CGRect(x: 40, y: 400, width: 200, height: 150))
        blueView.backgroundColor = .blue
        
        let yellowView = UIView(frame: CGRect(x: 100, y: 600, width: 180, height: 150))
        yellowView.backgroundColor = .yellow
        
        // phải khai báo contentSize mới scroll được
        // công thức tính width -> lấy vị trí lớn nhất = x + with
        // công thức tính hight -> lấy vị trí lớn nhất = y + height
        scrollView.contentSize = CGSize(width: 320, height: 750) // width = 0 + 320 = 320 ; height = 600 + 150 = 750
        //scrollView.contentOffset = CGPoint(x: 0, y: 160) // set vị trí ban đầu
        //crollView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0) // // cách viền TOP của scrollview 100
        
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(redView)
        scrollView.addSubview(greenView)
        scrollView.addSubview(blueView)
        scrollView.addSubview(yellowView)
        
        scrollView.delegate = self
        
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.scrollsToTop = false // mặc định là TRUE: khi chạm vào status bar thì scroll lên đầu trang
//        scrollView.isScrollEnabled = false
        
        
    }
}

extension ScrollViewProgrammatic: UIScrollViewDelegate {
    // khi chạm vào status bar thì nhảy vào hàm này
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("begin draggin")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("end dragging")
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scroll to top finish")
    }
    
}

