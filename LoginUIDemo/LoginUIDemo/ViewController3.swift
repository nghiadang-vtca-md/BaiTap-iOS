//
//  ViewController3.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/21/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Button
        
        let buttonCreateRuntime = UIButton(frame: CGRect(x: 20, y: 50, width: 100, height: 50))
        buttonCreateRuntime.setTitle("Run", for: .normal)
        buttonCreateRuntime.setTitleColor(.white, for: .normal)
        buttonCreateRuntime.backgroundColor = .blue
        buttonCreateRuntime.addTarget(self, action: #selector(button_click), for: .touchUpInside)
        
        self.view.addSubview(buttonCreateRuntime)
        
        // Button2
        
        let buttonCreateRuntime2 = UIButton(frame: CGRect(x: 150, y: 50, width: 100, height: 50))
        buttonCreateRuntime2.setTitle("Run", for: .normal)
        buttonCreateRuntime2.setTitleColor(.white, for: .normal)
        buttonCreateRuntime2.backgroundColor = .red
        buttonCreateRuntime2.addTarget(self, action: #selector(button_click), for: .touchUpInside)
        
        self.view.addSubview(buttonCreateRuntime2)
        
        // Button3
        
        let buttonCreateRuntime3 = UIButton(frame: CGRect(x: 280, y: 50, width: 100, height: 50))
        buttonCreateRuntime3.setTitle("Run", for: .normal)
        buttonCreateRuntime3.setTitleColor(.white, for: .normal)
        buttonCreateRuntime3.backgroundColor = .green
        buttonCreateRuntime3.addTarget(self, action: #selector(button_click), for: .touchUpInside)
        
        self.view.addSubview(buttonCreateRuntime3)
    }
    
    var isDown: Bool = true
    
    @objc func button_click(sender: UIButton){
        
        let newX = sender.frame.origin.x
        let newY = sender.frame.origin.y
        
        if isDown {
            sender.frame.origin = CGPoint(x: newX, y: newY + 50)
            if newY > 700 {
                isDown = false
            }
            
        } else {
            sender.frame.origin = CGPoint(x: newX, y: newY - 50)
            if newY < 100 {
                isDown = true
            }
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
