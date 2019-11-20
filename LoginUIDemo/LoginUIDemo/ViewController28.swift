//
//  ViewController28.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/18/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController28: UIViewController {
    
    let CELL_PADDING = 15
    let PADDING_LEFT = 20
    let PADDING_RIGHT = 20
    let NUMBER_OF_ITEMS_IN_LINE = 5
    var isEditingButton: Bool = false

    @IBOutlet weak var cvImages: UICollectionView!
    
    private var myCollectionCell: ViewController28_Cell!
    
    @IBAction func btnAdd_Click(_ sender: UIButton) {
        let pickerView = UIImagePickerController()
        pickerView.sourceType = .photoLibrary
        pickerView.delegate = self
        //pickerView.mediaTypes = ["media.image"]
        //pickerView.allowsEditing = true // cho phép chỉnh sửa
        self.present(pickerView, animated: true, completion: nil)
    }
    
    
    @IBAction func btnEditDone_Click(_ sender: UIButton) {
        if sender.titleLabel?.text == "Edit" {
            isEditingButton = true
            cvImages.reloadData()
            sender.setTitle("Done", for: .normal)
        } else {
            isEditingButton = false
            cvImages.reloadData()
            sender.setTitle("Edit", for: .normal)
        }
    }
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cvImages.dataSource = self
        cvImages.delegate = self
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

extension ViewController28: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellCV", for: indexPath) as? ViewController28_Cell else {
            return UICollectionViewCell()
        }
        
        //customCell.backgroundColor = indexPath.row % 2 == 0 ? .blue : .green
        customCell.myImage.image = images[indexPath.row]
        customCell.myImage.contentMode = .scaleToFill
        customCell.currentIndexPath = indexPath
        customCell.btnRemove.isHidden = isEditingButton ? false : true
        customCell.customDelegate = self
        return customCell
    }
}

extension ViewController28: CustomRemoveDelegate {
    func didClickRemoveButton(with indexPath: IndexPath?) {
        images.remove(at: indexPath?.row ?? -1)
        cvImages.reloadData()
    }
}

extension ViewController28: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController28: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = collectionView.collectionViewLayout.collectionViewContentSize
        let totalWidth = collectionView.frame.size.width
        
        let totalSpacing = CGFloat(PADDING_LEFT + PADDING_RIGHT + (NUMBER_OF_ITEMS_IN_LINE - 1) * CELL_PADDING)
        
        let cellWidth = (totalWidth - totalSpacing) / CGFloat(NUMBER_OF_ITEMS_IN_LINE)
        
        return CGSize(width: cellWidth, height: cellWidth)
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

extension ViewController28: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("did finish")
        picker.dismiss(animated: true, completion: nil) // phải setup bằng tay
        if let image = info[.originalImage] as? UIImage {
            images.append(image)
            cvImages.reloadData()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel")
        picker.dismiss(animated: true, completion: nil) // phải setup bằng tay
    }
}

