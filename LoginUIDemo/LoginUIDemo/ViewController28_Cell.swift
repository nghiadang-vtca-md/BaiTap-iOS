//
//  ViewController28_Cell.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/18/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

protocol CustomRemoveDelegate: class {
    func didClickRemoveButton(with indexPath: IndexPath?)
}

class ViewController28_Cell: UICollectionViewCell {
    
    var currentIndexPath: IndexPath?
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var btnRemove: UIButton!
    
    var customDelegate: CustomRemoveDelegate?
    
    @IBAction func btnRemove_Click(_ sender: UIButton) {
        customDelegate?.didClickRemoveButton(with: currentIndexPath)
    }
}
