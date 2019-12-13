//
//  TableViewCell_Category.swift
//  BTVatoApp
//
//  Created by user159518 on 12/13/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import UIKit

class TableViewCell_Category: UITableViewCell {

    @IBOutlet weak var lblCategory: UILabel!
    
    @IBAction func btnSeeMore_Click(_ sender: UIButton) {
        
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension TableViewCell_Category: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCategoryCell", for: indexPath)
        return cell
    }
    
    
}
extension TableViewCell_Category: UICollectionViewDelegate {
    
}

extension TableViewCell_Category: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 160)
    }
}
