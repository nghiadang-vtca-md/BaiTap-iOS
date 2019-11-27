//
//  ViewController.swift
//  MagazineCollectionView
//
//  Created by iMac_VTCA on 11/27/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib1 = UINib(nibName: "FirstCellCV", bundle: nil)
        self.myCollectionView.register(nib1, forCellWithReuseIdentifier: "firstCell")
        let nib2 = UINib(nibName: "SecondCellCV", bundle: nil)
        self.myCollectionView.register(nib2, forCellWithReuseIdentifier: "secondCell")
        let nib3 = UINib(nibName: "HeaderCellCV", bundle: nil)
        self.myCollectionView.register(nib3, forCellWithReuseIdentifier: "headerCell")
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        // về làm tiếp phần tính toán động khi chuyển màn hình khác
        // sử dụng constraint scale lại hình
        // tất cả cell header đều sử dụng file .xib
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCell", for: indexPath as IndexPath) as! FirstCellCV
            cell.backgroundColor = .cyan
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath as IndexPath) as! SecondCellCV
            cell.backgroundColor = .cyan
            cell.myLabel.text = String(indexPath.row)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionFooter) {
            
        } else if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath)
            // Customize headerView here
            return headerView
        }
        fatalError()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
             return CGSize(width: 560, height: 270)
        } else {
            return CGSize(width: 180, height: 270)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
}

