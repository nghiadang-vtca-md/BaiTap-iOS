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
    
    var activeDownloads: [String: TrackProgressDownload] = [:]
    
    func startDownload(with track: Track) {
        // class với struct khác gì khi tạo đối tượng ở đây ????
        let download = TrackProgressDownload(track: track)
        
        //guard let url = URL(string: track.previewUrl) else { return }
        
        //let downloadTask = downloadSession.downloadTask(with: url)
        //let downloadTask = downloadSession.downloadTask(with: newURL!)
        //downloadTask.resume()
        

        // giả lập để test bài hát dài
        // https://www.youtube.com/audiolibrary_download?vid=6722391bde350dc5
        // https://www.youtube.com/audiolibrary_download?vid=60281cc96333e210
        let newURL = URL(string: "https://www.youtube.com/audiolibrary_download?vid=6722391bde350dc5")
        
        download.task = downloadSession.downloadTask(with: newURL!)
        download.task?.resume()
        
        download.isDownloading = true
        print("url save download: \(download.track.previewUrl)")
        //activeDownloads[download.track.previewUrl] = download
        // tạo nhiều bài hat
        // http://youtube.com/audiolibrary
        activeDownloads[newURL?.absoluteString ?? "abc"] = download
        
    }
    
    func cancelDownload(with track: Track) {
        guard let download = activeDownloads[track.previewUrl] else {
            return
        }
        
        download.task?.cancel()
        activeDownloads[track.previewUrl] = nil
    }
    
    func pauseDownload(with track: Track) {
        guard let download = activeDownloads[track.previewUrl], download.isDownloading else { return }
        
        // huỷ task và lưu lại phần data đã được tải
        download.task?.cancel(byProducingResumeData: { (data) in
            download.resumeData = data
        })
        
        download.isDownloading = false
    }
    
    func resumeDownload(with track: Track) {
        guard let download = activeDownloads[track.previewUrl], !download.isDownloading else { return }
        
        // tạo ra task mới và truyền phần data đã được tải để tiếp tục
        if let resumeData = download.resumeData {
            download.task = downloadSession.downloadTask(withResumeData: resumeData)
        }
        
        download.task?.resume()
        download.isDownloading = true
    }
}
