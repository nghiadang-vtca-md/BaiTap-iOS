//
//  CardLayoutCollectionViewVC.swift
//  DemoCollectionView
//
//  Created by nghiadang1205 on 3/20/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class CardLayoutCollectionViewVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var quoteImages = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6"),
        UIImage(named: "7"),
        UIImage(named: "8"),
        UIImage(named: "9"),
        UIImage(named: "10")
    ]
    
    var quoteTitles = ["Quote 1:", "Quote 2:", "Quote 3:", "Quote 4:", "Quote 5:", "Quote 6:", "Quote 7:", "Quote 8:", "Quote 9:", "Quote 10:", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

}

extension CardLayoutCollectionViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quoteTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.quoteImage.image = quoteImages[indexPath.row]
        cell.titleQuote.text = quoteTitles[indexPath.row]
        
        // This creates the shadows and modifies the cards a little bit
        // Lưu ý: Chỉnh cell màu ở ngoài là màu trắng ( vì mặc định là không màu)
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    
}

extension CardLayoutCollectionViewVC: UICollectionViewDelegate {
    
}
