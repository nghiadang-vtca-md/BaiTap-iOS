//
//  DownloadService.swift
//  DemoDownloadFile_Practice
//
//  Created by user159518 on 12/25/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import Foundation

class DownloadService {
    var downloadSession: URLSession!
    
    func startDownload(with track: Track) {
        guard let url = URL(string: track.previewUrl) else { return }
        
        let downloadTask = downloadSession.downloadTask(with: url)
        
        downloadTask.resume()
    }
}
