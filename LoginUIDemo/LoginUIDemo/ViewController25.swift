//
//  ViewController25.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/15/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController25: UIViewController {

    private var myPageVC: VPageViewController25!
    
    @IBOutlet weak var mySegment: UISegmentedControl!
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        myPageVC.setCurrentViewController(with: sender.selectedSegmentIndex)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? VPageViewController25 {
            myPageVC = controller
            
            myPageVC.customDelegate = self // gán delegate để sử dụng được protocol vừa khai báo
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController25: CustomPageViewDelegate { // khai báo áp dụng protocol delegate
    func didUpdateSegment(with index: Int) {
        mySegment.selectedSegmentIndex = index
    }
    
    
}
