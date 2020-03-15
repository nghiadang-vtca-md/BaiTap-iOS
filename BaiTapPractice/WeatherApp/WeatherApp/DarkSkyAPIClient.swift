//
//  DarkSkyAPIClient.swift
//  WeatherApp by TeamTreeHouse
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let darkSkyApiKey = "31ff34d5b74b1e34b3b876f4db636f30"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.darkSkyApiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    // Sử dụng cho Codable
    let decoder = JSONDecoder()
    
    // chuyển DarkSkyError? thành Error?
    typealias WeatherCompletionHandler = (Weather?, Error?) -> Void
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    
    private func getWeather(at coordinate: Coordinate, completionHandler completion: @escaping WeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, DarkSkyError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        
        // Cách 1: Sử dụng jsonTask
//        let task = downloader.jsonTask(with: request) { (json, error) in
//            // Updating the UI  From a Background thread
//            DispatchQueue.main.async {
//                guard let json = json else {
//                    completion(nil, error)
//                    return
//                }
//
//                guard let weather = Weather(json: json) else {
//                    print("Here")
//                    completion(nil, .jsonParsingFailure)
//                    return
//                }
//
//                completion(weather, nil)
//            }
//        }
        // Cách 2: Sử dụng Codable
        let task = downloader.session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, DarkSkyError.requestFailed)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            let weather = try self.decoder.decode(Weather.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, error) // đã fix lỗi ở đây bằng cách chuyển DarkSkyError? thành Error?
                        }
                    } else {
                        completion(nil, DarkSkyError.invalidData)
                    }
                } else if let error = error {
                    completion(nil, error)
                    return
                }
            }
        }
        
        task.resume()
        
    }
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getWeather(at: coordinate) { (weather, error) in
            completion(weather?.currently, error)
        }
    }
}
