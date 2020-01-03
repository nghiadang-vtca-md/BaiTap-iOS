//
//  Track.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import UIKit

struct Track: Codable {
    
    let artist: String
    let index: Int
    let name: String
    let previewURL: URL
    
    var isDownloaded = false
    
    init(name: String, artist: String, previewURL: URL, index: Int) {
        self.name = name
        self.artist = artist
        self.previewURL = previewURL
        self.index = index
        
        //TEST
//        self.previewURL = URL(string: "https://www.youtube.com/audiolibrary_download?vid=60281cc96333e210")!
    }
}
