//
//  Track.swift
//  DemoDownloadFile_Practice
//
//  Created by user159518 on 12/25/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import Foundation

struct Track: Codable {
    var trackName: String
    var artistName: String
    var previewUrl: String
    
    init(name: String, artist: String, previewURL: String) {
        self.trackName = name
        self.artistName = artist
        self.previewUrl = previewURL
    }
}
