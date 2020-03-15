//
//  AlbumCellViewModel.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/11/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation
import UIKit

struct AlbumCellViewModel {
    let artwork: UIImage
    let title: String
    let genre: String
    let releaseDate: String
}

extension AlbumCellViewModel {
    init(album: Album) {
        self.artwork = (album.artworkState ==  AlbumArtworkState.downloaded ? album.artwork! : UIImage(systemName: "book")!)
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
