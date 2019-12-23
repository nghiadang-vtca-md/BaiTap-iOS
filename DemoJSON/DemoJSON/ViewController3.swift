//
//  ViewController3.swift
//  DemoJSON
//
//  Created by iMac_VTCA on 12/20/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

struct ObjectFromServerItunes: Codable {
    var results: [Track]
    var resultCount: Int
}

struct Track: Codable {
    var trackName: String
    var artistName: String
    var previewUrl: String
}

class ViewController3: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbvTracks: UITableView!
    @IBOutlet weak var labelNoSong: UILabel!
    
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var arrayTrack: [Track] = []
    var keyword = "happy"
    
    // danh cho download
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    let downloadService = DownloadService()
    
    lazy var downloadSession: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "download")
        //return URLSession(configuration: configuration)
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil) // lưu ý: nếu "self" bị lỗi -> phải extension thêm "URLSessionDelegate"
    }()
    
    
//    override func loadView() {
//        requestAPI()
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tbvTracks.dataSource = self
        searchBar.delegate = self
        
        downloadService.downloadSession = downloadSession
        
        let nib = UINib(nibName: "TrackItem_Cell", bundle: nil)
        tbvTracks.register(nib, forCellReuseIdentifier: "myTrackCellXib")
        
        intializeUI()
        
    }
    
    func intializeUI() {
        tbvTracks.isHidden = true
        labelNoSong.isHidden = false
    }
    
    private func requestAPI(with searchText: String) {
        
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchText)"
            
            guard let url = urlComponents.url else { return }
            
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                defer {
                    self.dataTask = nil
                }
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    print("Success")
                    do {
                        let objectDecoder = try JSONDecoder().decode(ObjectFromServerItunes.self, from: data)
                        print(objectDecoder.resultCount)
                        
                        // gan du lieu vo array nheeee
                        self.arrayTrack = objectDecoder.results
                        DispatchQueue.main.async {
                            if objectDecoder.resultCount == 0 {
                                self.labelNoSong.isHidden = false
                                self.tbvTracks.isHidden = true
                            } else {
                                self.labelNoSong.isHidden = true
                                self.tbvTracks.isHidden = false
                            }
                            self.tbvTracks.reloadData()
                        }
                        
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            })
        }
        dataTask?.resume()
        
    }

    /*
     // ITUNES APP

     https://itunes.apple.com/search?media=music&entity=song&term=songname

     get du lieu voi nhung field sau:
     previewUrl; trackName; artistName
    */

}

extension ViewController3: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTrack.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTrackCell", for: indexPath) as? UITableViewCell else {
//            return UITableViewCell()
//        }
        
//        cell.textLabel?.text = arrayTrack[indexPath.row].trackName
//        cell.detailTextLabel?.text = arrayTrack[indexPath.row].artistName
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTrackCellXib", for: indexPath) as? TrackItem_Cell else {
            return UITableViewCell()
        }
        
        cell.visualize(data: arrayTrack[indexPath.row])
        
        cell.downloadDelegate = self // dòng này QUAN TRỌNG lắm luôn
        
        return cell
    }
    
    
}

extension ViewController3: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        print(searchText)
        requestAPI(with: searchText)
        self.view.endEditing(true)
    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//        requestAPI(with: searchText)
//        self.view.endEditing(true)
//    }
}

extension ViewController3: DownloadTrackDelegate {
    func downloadTapped(_ cell: TrackItem_Cell) {
        if let indexPath = tbvTracks.indexPath(for: cell) {
            let track = arrayTrack[indexPath.row]
            downloadService.startDownload(with: track)
        }
    }
    
    func cancelTapped(_ cell: TrackItem_Cell) {
        print("nnnn")
    }
    
    
}

// 2 cái này đi kèm
extension ViewController3: URLSessionDelegate {
    
}

extension ViewController3: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        guard let sourceURL = downloadTask.originalRequest?.url else {
            return
        }
        
        let lastPathComponent = sourceURL.lastPathComponent
        
        let destinationURL = documentsPath.appendingPathComponent(lastPathComponent)
        
        print(destinationURL)
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL) // remove trước rồi copy sau cho chắc ăn
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }

    
}

// end 2 cái này đi kèm
