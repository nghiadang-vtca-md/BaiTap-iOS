//
//  DownloadService.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import Foundation

class DownloadService {
    
    //
    // MARK: - Variables And Properties
    //
    var activeDownload: [URL: Download] = [:]

    var downloadsSession: URLSession!
    
    //
    //MARK: - Internal methods
    //
    func startDownload(with track: Track) {
        
        let download = Download(track: track)
        
        download.task = downloadsSession.downloadTask(with: track.previewURL)
        
        download.task?.resume()
        
        download.isDownloading = true
        
        activeDownload[download.track.previewURL] = download
    }
    
    func cancelDownload(with track: Track) {
        
        guard let download = activeDownload[track.previewURL] else { return }
        
        download.task?.cancel()
        download.resumeData = nil
        activeDownload[track.previewURL] = nil
    }
    
    func pauseDownload(with track: Track) {
        
        guard let download = activeDownload[track.previewURL],
            download.isDownloading else { return }
        
        download.task?.cancel(byProducingResumeData: { (data) in
            download.resumeData = data
        })
        
        download.isDownloading = false
    }
    
    func resumeDownload(with track: Track) {
        
        guard let download = activeDownload[track.previewURL] else { return }
        
        if let resumeData = download.resumeData {
            download.task = downloadsSession.downloadTask(withResumeData: resumeData)
        }
        
        download.task?.resume()
        download.isDownloading = true
    }
}
