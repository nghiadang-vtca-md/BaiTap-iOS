//
//  Download.swift
//  NewNetworking
//
//  Created by iMac_VTCA on 12/25/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import Foundation

class Download {
    
    var isDownloading = false
    var progress: Float = 0
    var resumeData: Data?
    var task: URLSessionDownloadTask?
    var track: Track
    
    init(track: Track) {
        self.track = track
    }    
}
