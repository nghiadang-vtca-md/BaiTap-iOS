//
//  Helper.swift
//  DemoDownloadFile_Practice
//
//  Created by user159518 on 12/25/19.
//  Copyright © 2019 user159518. All rights reserved.
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
