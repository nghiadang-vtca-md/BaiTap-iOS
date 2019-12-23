//
//  DownloadService.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import Foundation

class DownloadService {
    
    var downloadsSession: URLSession!
    
    func startDownload(with track: Track) {
        guard let url = URL(string: track.previewUrl) else {
             return
        }
        
        let downloadTask = downloadsSession.downloadTask(with: url)
        
        downloadTask.resume()
    }
    

}
