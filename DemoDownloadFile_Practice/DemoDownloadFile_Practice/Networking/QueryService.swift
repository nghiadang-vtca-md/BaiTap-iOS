//
//  QueryService.swift
//  DemoDownloadFile_Practice
//
//  Created by user159518 on 12/25/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import Foundation

class QueryService {
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    var tracks: [Track] = []
    
    
    typealias JSONDictionary = [String: Any]
    //
    
    func getSearchResults(searchTerm: String, completion: @escaping ([Track]?, String) -> Void) {
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            
            guard let url = urlComponents.url else {
                return
            }
            
            dataTask = defaultSession.dataTask(with: url, completionHandler: { [weak self] (data,  response, error) in
                defer {
                    self?.dataTask = nil
                }
                
                if let error = error {
                    self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data, let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    
                    self?.updateSearchResults(data)
                    
                    DispatchQueue.main.async {
                        completion(self?.tracks, self?.errorMessage ?? "")
                    }
                }
            })
        }
        dataTask?.resume()
    }
    
    
    func updateSearchResults(_ data: Data) {
        var respone: JSONDictionary?
        tracks.removeAll()
        
        do {
            respone = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        
        guard let array = respone!["results"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            return
        }
        
        var index = 0
        
        for trackDictionary in array {
            if let trackDictionary = trackDictionary as? JSONDictionary,
                let name = trackDictionary["trackName"] as? String,
                let artist = trackDictionary["artistName"] as? String,
                let previewURL = trackDictionary["previewUrl"] as? String {
                tracks.append(Track(name: name, artist: artist, previewURL: previewURL))
                index += 1
            } else {
                errorMessage += "Problem parsing trackDictionary\n"
            }
        }
    }
}
