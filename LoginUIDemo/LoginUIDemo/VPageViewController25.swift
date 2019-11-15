//
//  VPageViewController25.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/15/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

protocol CustomPageViewDelegate: class {
    func didUpdateSegment(with index: Int)
}

class VPageViewController25: UIPageViewController {

    private var currentIndex = 0
    
    var customDelegate: CustomPageViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // luôn luôn nhớ cài đặt 2 thuộc tính nàyyyy
        dataSource = self
        delegate = self
        
        setCurrentViewController(with: 0)
    }
    
    
    
    private(set) lazy var arrayViewController: [UIViewController] = {
        return [self.getViewController(color: "Blue"),
                self.getViewController(color: "Green"),
                self.getViewController(color: "Red")]
    }()
    
    
    
    func getViewController(color: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "\(color)VC")
        return vc
    }
    
    func setCurrentViewController(with index: Int) {
        let count = arrayViewController.count
        guard index >= 0 && index < count else {
            return
        }
        let vc = arrayViewController[index]
        
        let direction: NavigationDirection = currentIndex > index ? .reverse : .forward
        
        setViewControllers([vc], direction: direction, animated: true, completion: nil)
        
        currentIndex = index
    }

    /*
    B1: Tạo màn hình PageViewController, tạo PageViewController.swift add vào inspector
     B2: Tạo 3 màn hình ViewController, đặt tên "Storyboard Id" và check (Identity Inspector)
     
    */

}

extension VPageViewController25: UIPageViewControllerDataSource {
    // vuốt từ trái sang phải
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex: Int = arrayViewController.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return arrayViewController[2]
        }
        
        return arrayViewController[previousIndex]
    }
    // vuốt từ phải sang trái
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex: Int = arrayViewController.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < arrayViewController.count else {
            return arrayViewController[0]
        }
        
        return arrayViewController[nextIndex]
    }
}

extension VPageViewController25: UIPageViewControllerDelegate {
    // lấy index viewcontroller hiện tại
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = arrayViewController.firstIndex(of: visibleViewController) {
            print(index)
            currentIndex = index
            customDelegate?.didUpdateSegment(with: index) // sử dụng delegate custom
        }
    }
}
