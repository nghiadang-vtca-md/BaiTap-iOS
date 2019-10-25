//
//  ViewController10.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/25/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController10: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    var timer: Timer!
    var count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Scroll tới range có vị trí 354 lấy 10 kí tự
        let range = NSMakeRange(354, 10)
        myTextView.scrollRangeToVisible(range)
        //
        
        // Tạo textView bằng code
        let dynamicTextView = UITextView(frame: CGRect(x: 80, y: 700, width: 200, height: 200))
        dynamicTextView.text = "Larem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. https://github.com/nghiadang-vtca-md/testRepo Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. 0903962070"
        dynamicTextView.isEditable = false
        dynamicTextView.dataDetectorTypes = [.phoneNumber,.link]
        self.view.addSubview(dynamicTextView)
        //
        
        // Tạo timer chạy progress view
        myProgressView.progress = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self](_) in
            let progressUpdate = (self?.myProgressView.progress)! + 0.1 // không được làm vậy !!!
            self?.myProgressView.setProgress(progressUpdate, animated: true)
            
            if(self?.myProgressView.progress == 1) {
                self?.timer.invalidate()
                self?.timer = nil
            }
            print(self?.count ?? 0)
            self?.count += 1
        })
        //
    }
    

    /* For UITextView
     Chú ý Behavior và Data Detector
     - nếu sử dụng detector thì bỏ check Editable
    
    */
    
    /* For UIProgress
     nhắc lại liên kết strong weak
     - 2 liên kết đến một biến -> gọi là liên kết mạnh
     - khi huỷ một liên kết thì còn lại 1 liên kết -> weak self
 
    */

}
