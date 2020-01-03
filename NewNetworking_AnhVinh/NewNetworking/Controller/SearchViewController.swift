//
//  SearchViewController.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import UIKit
import AVKit

class SearchViewController: UIViewController {
    
    //
    //MARK :- Outlet
    //
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //
    //MARK: - Constant
    //
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let queryService = QueryService()
    let downloadService = DownloadService()
    
    //MARK :- Variables
    var searchResults: [Track] = []
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    lazy var downloadsSession: URLSession = {
        let configureation = URLSessionConfiguration.background(withIdentifier: "download")
        return URLSession(configuration: configureation, delegate: self, delegateQueue: nil)
    }()
    
    //
    //MARK: - View life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        downloadService.downloadsSession = downloadsSession
        getTrackWithName("Happy new year")
    }
    
    //
    //MARK :- Private function
    //
    @objc func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    private func getTrackWithName(_ songName: String) {
        queryService.getSearchResults(searchTerm: songName) { [weak self] results, errorMessage in
            
            if let results = results {
                self?.searchResults = results
                self?.contentTableView.reloadData()
                self?.contentTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
            
            if !errorMessage.isEmpty {
                print("Search error: " + errorMessage)
            }
        }
    }
    
    private func reload(_ row: Int) {
      contentTableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
    }
}

//
//MARK: - UISearchBarDelegate
//
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        
        getTrackWithName(searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }
}

//
//MARK: - UITableViewDataSource
//
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SongTableViewCell.createCell(tableView: tableView)
        cell.delegate = self
        
        let track = searchResults[indexPath.row]
        
//        cell.visualizeCell(with: track, download: downloadService.activeDownload[track.previewURL])
        
        cell.configure(track: track,
        downloaded: track.isDownloaded,
        download: downloadService.activeDownload[track.previewURL])
       
        return cell
    }
}

//
//MARK: - UITableViewDelegate
//
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//MARK: - SongTableViewCellDelegate
//
extension SearchViewController: SongTableViewCellDelegate {
    
    func downloadTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            let track = searchResults[indexPath.row]
            downloadService.startDownload(with: track)
            reload(indexPath.row)
        }
    }
    
    func cancelTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            let track = searchResults[indexPath.row]
            downloadService.cancelDownload(with: track)
            reload(indexPath.row)
        }
    }
    
    func pauseTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            let track = searchResults[indexPath.row]
            downloadService.pauseDownload(with: track)
            reload(indexPath.row)
        }
    }
    
    func resumeTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            let track = searchResults[indexPath.row]
            downloadService.resumeDownload(with: track)
            reload(indexPath.row)
        }
    }
}

//
//MARK: - URLSessionDelegate
//
extension SearchViewController: URLSessionDelegate {
    
}

//
//MARK: - URLSessionDownloadDelegate
//
extension SearchViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        guard
            let sourceUrl = downloadTask.originalRequest?.url,
            let download = downloadService.activeDownload[sourceUrl]
            else { return }
        
//        downloadService.activeDownload[sourceUrl] = nil
        
        let lastPathComponent = sourceUrl.lastPathComponent
        
        let destinationURL = documentsPath.appendingPathComponent(lastPathComponent)
        print(destinationURL)
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
            download.track.isDownloaded = true
        } catch let error {
            print(error.localizedDescription)
        }
        
        let indexPath = IndexPath(row: download.track.index, section: 0)
        
        DispatchQueue.main.async { [weak self] in
            self?.contentTableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        guard
            let sourceUrl = downloadTask.originalRequest?.url,
            let download = downloadService.activeDownload[sourceUrl]
            else { return }
        
        download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
        
        DispatchQueue.main.async {
            
            let indexPath = IndexPath(row: download.track.index, section: 0)
            
            if let cell = self.contentTableView.cellForRow(at: indexPath) as? SongTableViewCell {
//                cell.updateDisplay(progress: download.progress, totalSize: totalSize, download: download)
                cell.updateDisplay(progress: download.progress, totalSize: totalSize)
            }
        }
    }
}
