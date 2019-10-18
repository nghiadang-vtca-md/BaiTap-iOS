//
//  ViewController2.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/18/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    // Properties
    
    @IBOutlet weak var btnRandom: UIButton!
    
    // Actions
    @IBAction func btnRandom_TUI(_ sender: UIButton) {
        self.i += 1
        createLabel(title: self.i)
    }
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func createLabel(title: Int) -> Void {
        let randomInt_x = Int.random(in: 1...384)
        let randomInt_y = Int.random(in: 1...866)
        
        let newLabel = UILabel(frame: CGRect(x: randomInt_x, y: randomInt_y, width: 30, height: 30))
        newLabel.text = String(title)
        newLabel.backgroundColor = .yellow
        
        self.view.addSubview(newLabel)
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
