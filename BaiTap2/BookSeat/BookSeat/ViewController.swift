//
//  ViewController.swift
//  BookSeat
//
//  Created by user159518 on 12/4/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let CELL_PADDING = 10
    let PADDING_LEFT = 20
    let PADDING_RIGHT = 20
    let NUMBER_OF_ITEMS_IN_LINE = 5
    //var NUMBER_OF_ITEMS = 0
    
    var arrayTest: [[Int]] = [[1,0,1,0,1],
                            [1,0,1,0,1],
                            [1,0,1,0,1],
                            [1,0,1,0,1],
                            [1,1,1,1,1]]
    
//    func countTotalItem(array: [[Int]]) -> Int {
//        var res = 0
//        for line in array {
//            res += line.count
//        }
//        print(res)
//        return res
//    }
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        myCollectionView.register(nib, forCellWithReuseIdentifier: "myCell")
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayTest.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTest[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        
        
//        let line: Int = ((indexPath.item + 1) / 5)
//        let position: Int = ((indexPath.item) % 5)
//        if line < 5 {
//            if arrayTest[line][position] == 0 {
//                customCell.isHidden = true
//            }
//        }
        
        if arrayTest[indexPath.section][indexPath.item] == 0 {
            customCell.isHidden = true
        }
        
        return customCell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = collectionView.collectionViewLayout.collectionViewContentSize
        let totalWidth = collectionView.frame.size.width
        
        let totalSpacing = CGFloat(PADDING_LEFT + PADDING_RIGHT + (NUMBER_OF_ITEMS_IN_LINE - 1) * CELL_PADDING)
        
        let cellWidth = (totalWidth - totalSpacing) / CGFloat(NUMBER_OF_ITEMS_IN_LINE)
        
        return CGSize(width: cellWidth, height: cellWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(CELL_PADDING), left: CGFloat(PADDING_LEFT), bottom: 0, right: CGFloat(PADDING_RIGHT))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(CELL_PADDING)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(CELL_PADDING)
    }
}

