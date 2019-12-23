//
//  SearchViewController.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK :- Outlet
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK :- Variables
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    let queryService = QueryService()
    let downloadService = DownloadService()
    
    var searchResults: [Track] = []
    
    var currentIndexPath: IndexPath?
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    lazy var downloadsSession: URLSession = {
        let configureation = URLSessionConfiguration.background(withIdentifier: "download")
        return URLSession(configuration: configureation, delegate: self, delegateQueue: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        downloadService.downloadsSession = downloadsSession
        getTrackWithName("Happy new year")
    }
    
    //MARK :- private function
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SongTableViewCell.createCell(tableView: tableView)
        cell.visulizeCell(with: searchResults[indexPath.row])
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
        }
    
    }
    
    func cancelTapped(_ cell: SongTableViewCell) {
        
    }
}
extension SearchViewController: URLSessionDelegate {
    
}

extension SearchViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        
        guard let sourceURL = downloadTask.originalRequest?.url else {
            return
        }
        
        print(documentsPath)
        let lastPathComponent = sourceURL.lastPathComponent
        
        let destinationURL = documentsPath.appendingPathComponent(lastPathComponent)
        print(destinationURL)
        
        
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
        
        
        DispatchQueue.main.async {
            if let indexPath = self.currentIndexPath,
              let cell = self.contentTableView.cellForRow(at: indexPath) as? SongTableViewCell {
              cell.updateDisplay(progress: progress, totalSize: totalSize)
          }
        }
        
        
        print("progress = \(progress) totalSize = \(totalSize)")
    }
    
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
//                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
//                    totalBytesExpectedToWrite: Int64) {
      
      
      // 2
//      let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
//      // 3
//      let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
//
//      // 4
//      DispatchQueue.main.async {
//        if let trackCell = self.tableView.cellForRow(at: IndexPath(row: download.track.index,
//                                                                   section: 0)) as? TrackCell {
//          trackCell.updateDisplay(progress: progress, totalSize: totalSize)
//        }
//      }
//    }
}
