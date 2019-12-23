//
//  DownloadService.swift
//  DemoJSON
//
//  Created by iMac_VTCA on 12/23/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import Foundation

class DownloadService {
    
    var downloadSession: URLSession!
    
    func startDownload(with track: Track) {
        guard let url = URL(string: track.previewUrl) else {
            return
        }
        
        let downloadTask = downloadSession.downloadTask(with: url)
        
        downloadTask.resume()
    }
    
    

    

}
