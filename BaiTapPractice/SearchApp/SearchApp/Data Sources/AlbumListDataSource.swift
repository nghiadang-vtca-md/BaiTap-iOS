//
//  AlbumListDataSource.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/11/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    
    private var albums: [Album]
    
    // tracking artwork download
    let pendingOperations = PendingOperations()
    
    // To reload tableView when artwork complete
    let tableView: UITableView
    
    
    init(albums: [Album], tableView: UITableView) {
        self.albums = albums
        self.tableView = tableView
        super.init()
    }
    
    // MARK: - TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as? AlbumCell else {
            return UITableViewCell()
        }
        
        let album = self.albums[indexPath.row]
        
        let albumViewModel = AlbumCellViewModel(album: album)
        cell.configure(with: albumViewModel)
        cell.accessoryType = .disclosureIndicator
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
        }
        
        return cell
    }
    
    
    // MARK: Helpers
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func update(with albums: [Album]) {
        self.albums = albums
    }
    
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        // đã tồn tại trong queue thì không cần làm gì hết
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        // chưa tồn tại trong queue
        let downloader = ArtworkDownloader(album: album)
        downloader.completionBlock = { // completion closure
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
        
        
    }
    
    
    
    
}
