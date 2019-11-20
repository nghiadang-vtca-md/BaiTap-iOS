//
//  ViewController29.swift
//  LoginUIDemo
//
//  Created by user159518 on 11/20/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController29: UIViewController {

    let CELL_PADDING = 15
    let PADDING_LEFT = 20
    let PADDING_RIGHT = 20
    let NUMBER_OF_ITEMS_IN_LINE = 3
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
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

extension ViewController29: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCVCell", for: indexPath) as? ViewController29_Cell else {
            return UICollectionViewCell()
        }
        
        customCell.backgroundColor = indexPath.row % 2 == 0 ? .blue : .green
        
        return customCell
    }
}


extension ViewController29: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = collectionView.collectionViewLayout.collectionViewContentSize
        let totalWidth = collectionView.frame.size.width
        
        let totalSpacing = CGFloat(PADDING_LEFT + PADDING_RIGHT + (NUMBER_OF_ITEMS_IN_LINE - 1) * CELL_PADDING)
        
        let cellWidth = (totalWidth - totalSpacing) / CGFloat(NUMBER_OF_ITEMS_IN_LINE)
        
        let rowEven = (((indexPath.row + 1) / NUMBER_OF_ITEMS_IN_LINE) + 1) % 2 == 0 ? true : false
        let orderInRow = (indexPath.row % NUMBER_OF_ITEMS_IN_LINE) // 0 1 2
        
        if !rowEven {
            if (orderInRow == 0 || orderInRow == 2) {
                return CGSize(width: cellWidth, height: cellWidth)
            } else {
                return CGSize(width: cellWidth, height: cellWidth * 2)
            }
        } else {
           if (orderInRow == 0 || orderInRow == 2) {
                return CGSize(width: cellWidth, height: cellWidth * 2)
            } else {
                return CGSize(width: cellWidth, height: cellWidth)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: CGFloat(PADDING_LEFT), bottom: 0, right: CGFloat(PADDING_RIGHT))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(CELL_PADDING)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(CELL_PADDING)
    }
}
