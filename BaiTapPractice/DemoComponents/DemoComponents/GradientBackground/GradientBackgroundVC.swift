//
//  GradientBackgroundVC.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/29/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class GradientBackgroundVC: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myButton.layer.cornerRadius = myButton.frame.size.height / 2
        myButton.layer.masksToBounds = true
        
        //view.setGradientBackground(colorOne: UIColor.black, colorTwo: UIColor.green)
        
        view.setCrazyGradientBackground(colorOne: UIColor.white, colorTwo: UIColor.black, colorThree: UIColor.blue, colorFour: UIColor.orange)
        
        myView.setGradientBackground(colorOne: UIColor.white, colorTwo: UIColor.blue)
        
        myButton.setGradientBackground(colorOne: UIColor.orange, colorTwo: UIColor.yellow)
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
