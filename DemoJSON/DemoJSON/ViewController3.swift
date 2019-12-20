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
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var arrayTrack: [Track] = []
    var keyword = "happy"
    
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
        requestAPI()
    }
    
    private func requestAPI() {
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(self.keyword)"
            
            guard let url = urlComponents.url else { return }
            
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    print("Success")
                    do {
                        let objectDecoder = try JSONDecoder().decode(ObjectFromServerItunes.self, from: data)
                        print(objectDecoder.resultCount)
                        // gan du lieu vo array nheeee
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTrackCell", for: indexPath) as? UITableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = arrayTrack[indexPath.row].trackName
        cell.detailTextLabel?.text = arrayTrack[indexPath.row].artistName
        
        return cell
    }
    
    
}
