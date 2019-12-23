//
//  Track.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import UIKit

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
