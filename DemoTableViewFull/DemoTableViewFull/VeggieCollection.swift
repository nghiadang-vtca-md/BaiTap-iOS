//
//  VeggieCollection.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/19/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class VeggieCollection: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
        

    typealias Veggie = Food
    typealias VeggieCell = FoodCell
    var data: [Veggie] = []
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        data = FruitsNVeggies.FoodItems().last?.foodItems ?? []
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! VeggieCell
        
        let veggieItem = data[indexPath.row]
        cell.config(with: veggieItem)
        return cell
    }

    
}

extension VeggieCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160.0, height: 160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
