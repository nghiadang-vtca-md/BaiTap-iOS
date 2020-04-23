//
//  ImageSliderWithCollectionViewVC.swift
//  DemoCollectionView
//
//  Created by nghiadang1205 on 3/19/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ImageSliderWithCollectionViewVC: UIViewController {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var vocabLabel: UILabel!
    
    var imgArr = [
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
    
    var vocabArr = ["Dog", "Cat", "Lion", "Elephant", "Leo", "Fish", "Camel", "Birth", "Monkey"]
    
    var timer = Timer()
    var counter = 0
    
    var timerVocab = Timer()
    var counterVocab = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        
        // Lưu ý:
        // Bỏ check Show horizotal vertical
        // Check Paging Enable
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        
        self.timerVocab = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeVocab), userInfo: nil, repeats: true)
        
    }
    
    @objc func changeImage() {
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter , section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
    }
    
    @objc func changeVocab() {
        if counterVocab < vocabArr.count {
            UIView.animate(withDuration: 0.2) {
                self.vocabLabel.text = self.vocabArr[self.counterVocab]
            }
            counterVocab += 1
        } else {
            counterVocab = 0
            UIView.animate(withDuration: 0.2) {
                self.vocabLabel.text = self.vocabArr[self.counterVocab]
            }
            counterVocab = 1
        }
    }
    
    
    

}

extension ImageSliderWithCollectionViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        }
        
        return cell
    }
    
    
}

extension ImageSliderWithCollectionViewVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
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
