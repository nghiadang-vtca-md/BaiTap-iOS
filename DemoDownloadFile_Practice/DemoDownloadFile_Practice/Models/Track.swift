//
//  Track.swift
//  DemoDownloadFile_Practice
//
//  Created by user159518 on 12/25/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import Foundation

struct Track: Codable {
    var index: Int
    var trackName: String
    var artistName: String
    var previewUrl: String
    
    init(name: String, artist: String, previewURL: String, index: Int) {
        self.index = index
        self.trackName = name
        self.artistName = artist
        self.previewUrl = previewURL
    }
}

class TrackProgressDownload {
    var isDownloading = false
    var progress: Float = 0.0
    var resumeData: Data?
    var task: URLSessionDownloadTask?
    var track: Track
    init(track: Track) {
        self.track = track
    }
}
