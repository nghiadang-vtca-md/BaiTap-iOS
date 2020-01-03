//
//  SearchViewController.swift
//  DemoDownloadFile_Practice
//
//  Created by user159518 on 12/25/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController {

    //MARK :- Variables
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contentTableView: UITableView!
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    let queryService = QueryService()
    let downloadService = DownloadService()
    //
    
    var searchResults: [Track] = []
    var tracksDownloading: [TrackProgressDownload] = []
    
    var currentIndexPath: IndexPath?
    
    //
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        return recognizer
    }()
    
    @objc func dissmissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    lazy var downloadSession: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "download")
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentTableView.dataSource = self
        contentTableView.delegate = self
        searchBar.delegate = self
        
        downloadService.downloadSession = downloadSession
        getTrackWithName("Happy new year")
        
    }
    

    private func getTrackWithName(_ songName: String) {
        queryService.getSearchResults(searchTerm: songName) { [weak self] (results, errorMessage) in
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
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dissmissKeyboard()
        
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        
        getTrackWithName(searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(searchResults.count)
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SongTableViewCell.createCell(tableView: tableView)
        // giải quyết vấn đề thêm TrackProgressDownload ở đây
        cell.visualizeCell(with: searchResults[indexPath.row])
        
        cell.delegate = self
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: SongTableViewCellDelegate {
    func downloadTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            currentIndexPath = indexPath
            let track = searchResults[indexPath.row]
            downloadService.startDownload(with: track)
            self.contentTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func cancelTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            let track = searchResults[indexPath.row]
            downloadService.cancelDownload(with: track)
        }
    }
    
    func pauseTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            let track = searchResults[indexPath.row]
            downloadService.pauseDownload(with: track)
        }
    }
       
    func resumeTapped(_ cell: SongTableViewCell) {
        if let indexPath = contentTableView.indexPath(for: cell) {
            let track = searchResults[indexPath.row]
            downloadService.resumeDownload(with: track)
        }
    }
}

extension SearchViewController: URLSessionDelegate {
    
}

extension SearchViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let sourceURL = downloadTask.originalRequest?.url else { return }
        
        print(sourceURL.absoluteString)
        print(sourceURL.path)
        print(sourceURL.relativeString)
        print(sourceURL.relativePath)
        let lastPathComponent = sourceURL.lastPathComponent
        print(lastPathComponent)
        
        let destinationURL = documentsPath.appendingPathComponent(lastPathComponent)
        print(destinationURL)
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
        
        // lấy trackProgressDownload thông qua "downloadTask" và "DownloadService"
        guard let sourceURL = downloadTask.originalRequest?.url?.absoluteString,
                let download = downloadService.activeDownloads[sourceURL] else { return }
        
        download.progress = progress
        
        DispatchQueue.main.async {
//            if let indexPath = self.currentIndexPath,
//                let cell = self.contentTableView.cellForRow(at: indexPath) as? SongTableViewCell {
//                cell.updateDisplay(progress: progress, totalSize: totalSize)
//            }
            // Xử lý vấn đề lưu trạng thái cho mỗi track
            let indexPath = IndexPath(row: download.track.index, section: 0)
            if let cell = self.contentTableView.cellForRow(at: indexPath) as? SongTableViewCell {
                cell.updateDisplay(progress: download.progress, totalSize: totalSize)
            }
        }
        
    }
    
    
}
