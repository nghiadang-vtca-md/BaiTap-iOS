//
//  PendingOperations.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/15/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}
