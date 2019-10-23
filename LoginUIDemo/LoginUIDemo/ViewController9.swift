//
//  ViewController9.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/23/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController9: UIViewController {
    // Properties
    @IBOutlet weak var btnStartGame: UIButton!
    
    @IBOutlet weak var imageYour1: UIImageView!
    @IBOutlet weak var imageYour2: UIImageView!
    @IBOutlet weak var imageYour3: UIImageView!
    
    @IBOutlet weak var imageComputer1: UIImageView!
    @IBOutlet weak var imageComputer2: UIImageView!
    @IBOutlet weak var imageComputer3: UIImageView!
    // Actions
    
    @IBAction func btnStartGame_Click(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let name = 1...13
        let category = ["c","r","ch","b"]
        for _ in 1...6 {
            
        }
        
        var shuffleName = name.shuffled()
        
        shuffleName.removeLast()
        
        
        
        
    }
    
    func generateDeckOfCards() -> [UIImage] {
        var cards: [UIImage] = []
        let categories = ["c","r","ch","b"]
        for name in 1...13 {
            for category in categories {
                if let image = UIImage(named: "\(name)_\(category).png") {
                    cards.append(image)
                }
            }
        }
        return cards
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
