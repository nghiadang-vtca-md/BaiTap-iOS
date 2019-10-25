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
    @IBOutlet weak var btnAgain: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var imageYour1: UIImageView!
    @IBOutlet weak var imageYour2: UIImageView!
    @IBOutlet weak var imageYour3: UIImageView!
    
    @IBOutlet weak var imageComputer1: UIImageView!
    @IBOutlet weak var imageComputer2: UIImageView!
    @IBOutlet weak var imageComputer3: UIImageView!
    // Actions
    
    @IBAction func btnStartGame_Click(_ sender: UIButton) {
        dealTheCards(cards: self.cards)
        btnAgain.isHidden = false
        btnStartGame.isHidden = true
    }
    
    @IBAction func btnAgain_Click(_ sender: UIButton) {
        hideAllCards()
        btnAgain.isHidden = true
        btnStartGame.isHidden = false
        lblResult.isHidden = true
    }
    var cards: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cards = generateDeckOfCards()
        
        lblResult.isHidden = true
        
    }
    
    func generateDeckOfCards() -> [String] {
        var cards: [UIImage] = []
        var cardsString: [String] = []
        let categories = ["c","r","ch","b"]
        for name in 1...13 {
            for category in categories {
                if let image = UIImage(named: "\(name)_\(category).png") {
                    cards.append(image)
                    cardsString.append("\(name)_\(category).png")
                }
            }
        }
        return cardsString
    }
    
    func hideAllCards() {
        if let image = UIImage(named: "up.png") {
            imageYour1.image = image
            imageYour2.image = image
            imageYour3.image = image
            imageComputer1.image = image
            imageComputer2.image = image
            imageComputer3.image = image
        }
    }
    
    func dealTheCards(cards: [String] ) {
        var cardsShuffle = cards.shuffled()
//        let getCardYour1 = cardsShuffle.removeLast()
//        let getCardComputer1 = cardsShuffle.removeLast()
//        let getCardYour2 = cardsShuffle.removeLast()
//        let getCardComputer2 = cardsShuffle.removeLast()
//        let getCardYour3 = cardsShuffle.removeLast()
//        let getCardComputer3 = cardsShuffle.removeLast()
        
        // Cheating game
        let getCardYour1 = "13_b"
        let getCardComputer1 = cardsShuffle.removeLast()
        let getCardYour2 = "13_ch"
        let getCardComputer2 = cardsShuffle.removeLast()
        let getCardYour3 = "13_c"
        let getCardComputer3 = cardsShuffle.removeLast()
        //
        
        imageYour1.image = UIImage(named: getCardYour1)
        imageYour2.image = UIImage(named: getCardYour2)
        imageYour3.image = UIImage(named: getCardYour3)
        imageComputer1.image = UIImage(named: getCardComputer1)
        imageComputer2.image = UIImage(named: getCardComputer2)
        imageComputer3.image = UIImage(named: getCardComputer3)
        
        let yourPoint = calculatePoint(cards: [getCardYour1, getCardYour2, getCardYour3])
        let computerPoint = calculatePoint(cards: [getCardComputer1, getCardComputer2, getCardComputer3])
        
        if yourPoint > computerPoint {
            lblResult.text = "You win!"
        } else if yourPoint < computerPoint {
            lblResult.text = "Computer wins!"
        } else {
            lblResult.text = "Draw!"
        }
        
        lblResult.isHidden = false
        
    }
    
    func calculatePoint(cards: [String]) -> Int {
        var total: Int = 0
        var countTriple = 0
        for card in cards {
            let index = card.firstIndex(of: "_") ?? card.endIndex
            let point = card[..<index]
            let pointInt = Int(String(point)) ?? 0
            switch pointInt {
            case 1...9:
                total += pointInt
            case 11...13:
                countTriple += 1
            default:
                total += 0
            }
        }
        total = total % 10
        print(total)
        return countTriple == 3 ? 30 : total
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

