//
//  Helpers.swift
//  BaiTap5
//
//  Created by user159518 on 1/13/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit

public protocol Cell {
    static var identify: String { get }
}

public extension Cell {
    static var identify: String  {
        return "\(self)"
    }
}

public extension Cell where Self: UICollectionViewCell {
    static func createCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: self.identify, for: indexPath) as! Self
    }
}

public extension Cell where Self: UITableViewCell {
    static func createCell(tableView: UITableView) -> Self {
        return tableView.dequeueReusableCell(withIdentifier: self.identify) as! Self
    }
}
