//
//  SecondViewController.swift
//  DemoCharts
//
//  Created by nghiadang1205 on 3/30/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit

class CircularProgressVC: UIViewController {
    
    @IBOutlet weak var circular1: CircularProgressView!
    @IBOutlet weak var circular2: CircularProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Programmatic
        let cp = CircularProgressView(frame: CGRect(x: 10.0, y: 10.0, width: 100.0, height: 100.0))
        cp.trackColor = UIColor.red
        cp.progressColor = UIColor.yellow
        cp.tag = 101
        self.view.addSubview(cp)
        cp.center = self.view.center
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
        
        // Keo tha
        circular1.trackColor = UIColor.white
        circular1.progressColor = UIColor.purple
        circular1.setProgressWithAnimation(duration: 1.0, value: 0.4)
        
        circular2.trackColor = UIColor.white
        circular2.progressColor = UIColor.blue
        circular2.setProgressWithAnimation(duration: 1.0, value: 0.8)
        
        
    }
    
    @objc func animateProgress() {
        let cP = self.view.viewWithTag(101) as! CircularProgressView
        cP.setProgressWithAnimation(duration: 1.0, value: 0.7)
    }
    
    

    


}

