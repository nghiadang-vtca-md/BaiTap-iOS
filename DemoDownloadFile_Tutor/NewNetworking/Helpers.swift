//
//  Helpers.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import UIKit

// MARK: Cell extension
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
