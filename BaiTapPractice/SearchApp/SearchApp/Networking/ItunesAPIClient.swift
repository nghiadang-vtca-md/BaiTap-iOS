//
//  ItunesAPIClient.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/14/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForAritsts(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void) {
        let endpoint = Itunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))
        
        let task = downloader.jsonTask(with: endpoint.request) { (json, error) in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], error)
                    return
                }
                
                guard let results = json["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                // ở đây không phải là mảng 2 chiều
                // tại sao sử dụng flatMap thay cho map
                // vì flatMap trả về giá trị non-optional ( nếu nil thì không add vào array)
                // còn map thì ngược lại -> trả về optional?
                let artists = results.compactMap { Artist(json: $0) }
                
                completion(artists, nil)
            }
            
            
        }
        
        task.resume()
    }
    
    func lookupArtist(withId id: Int, completion: @escaping (Artist? ,ItunesError?) -> Void) {
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.album)
        
        performRequest(with: endpoint) { (results, error) in
            guard let results = results else {
                completion(nil, error)
                return
            }
            
            guard let artistInfo = results.first else {
                completion(nil, .jsonParsingFailure(message: "Results does not contain artist info"))
                return
            }
            
            guard let artist = Artist(json: artistInfo) else {
                completion(nil, .jsonParsingFailure(message: "Could not parse artist information"))
                return
            }
            
            let albumResults = results[1..<results.count]
            let albums = albumResults.compactMap{ Album(json: $0) }
            
            artist.albums = albums
            completion(artist, nil)
            
        }
    }
    
    func lookupAlbum(withId id: Int, completion: @escaping (Album?, ItunesError?) -> Void) {
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.song)
        
        performRequest(with: endpoint) { (results, error) in
            guard let results = results else {
                completion(nil, error)
                return
            }
            guard let albumInfo = results.first else {
                completion(nil, .jsonParsingFailure(message: "Results does not contain album info"))
                return
            }
            guard let album = Album(json: albumInfo) else {
                completion(nil, .jsonParsingFailure(message: "Could not parse album information"))
                return
            }
            let songResults = results[1..<results.count]
            let songs = songResults.compactMap { Song(json: $0) }
            
            album.songs = songs
            completion(album, nil)
        }
    }
    
    typealias Results = [[String: Any]]
    // refactor
    private func performRequest(with endpoint: Endpoint, completion: @escaping (Results?, ItunesError?) -> Void) {
        let task = downloader.jsonTask(with: endpoint.request) { (json, error) in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let results = json["results"] as? [[String: Any]] else {
                    completion(nil, .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                
                completion(results, nil)
            }
        }
        task.resume()
    }
}
