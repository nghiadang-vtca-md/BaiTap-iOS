//
//  ViewController2.swift
//  DemoJSON
//
//  Created by iMac_VTCA on 12/20/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

//let API_URL = "https://maps.googleapis.com/maps/api/geocode/json?latlng=10.802184,106.686711&output=json&key=AIzaSyD4S0Qu29xxQsOLCPzGBWacF_2ugvu0QoQ"

struct Location {
    var latitude: Double
    var longtitude: Double
    var place_id: String
}

struct Address: Codable {
    var place_id: String
    var geometry: Geometry
    
    //
    struct Geometry: Codable {
        var location: Location
    }
    struct Location: Codable {
        var latitude: Double
        var longitude: Double
        
        enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lng"
        }
    }
    //
}

struct ObjectFromServer: Codable {
    var address: [Address]
    
    enum CodingKeys: String, CodingKey {
        case address = "results"
    }
}

class ViewController2: UIViewController {
    // json data
    // https://maps.googleapis.com/maps/api/geocode/json?latlng=10.802184,106.686711&output=json&key=AIzaSyD4S0Qu29xxQsOLCPzGBWacF_2ugvu0QoQ
    //
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var arrayLocation: [Location] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        requestAPI()
    }
    
    private func requestAPI() {
        // 1
        dataTask?.cancel()
        // 2
        if var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json") {
            urlComponents.query = "latlng=10.802184,106.686711&output=json&key=AIzaSyD4S0Qu29xxQsOLCPzGBWacF_2ugvu0QoQ"
            // 3
            guard let url = urlComponents.url else { return }
            // 4
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                // 5
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    print("Success")
                    do {
                        //let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        /*
                         Lưu ý: phân biệt response dictionary {} và response mảng dictionary [{}]
                         */
                        // BT1: Lấy tất cả
//                        if let dictionary = object as? [String: Any] {
//                            if let arrayResultDict = dictionary["results"] as? [[String: Any]] {
//                                for dict in arrayResultDict {
//                                    let place_id = dict["place_id"] as? String ?? ""
//                                    if let geometry = dict["geometry"] as? [String: Any] {
//                                        if let location = geometry["location"] as? [String: Any] {
//                                            let lat = location["lat"] as? Double ?? 0.0
//                                            let long = location["lng"] as? Double ?? 0.0
//                                            let newLocation = Location(latitude: lat, longtitude: long, place_id: place_id)
//                                            self.arrayLocation.append(newLocation)
//                                        }
//                                    }
//                                }
//                                print(self.arrayLocation)
//                                print(self.arrayLocation.count)
//                            }
//                        }
                        // end BT1:
                        // BT2: Lấy phần tử đầu tiên
//                        if let dictionary = object as? [String: Any] {
//                            if let arrayResultDict = dictionary["results"] as? [[String: Any]] {
//                                if let firstItem = arrayResultDict.first {
//                                    let place_id = firstItem["place_id"] as? String ?? ""
//                                    if let geometry = firstItem["geometry"] as? [String: Any] {
//                                        if let location = geometry["location"] as? [String: Any] {
//                                            let lat = location["lat"] as? Double ?? 0.0
//                                            let long = location["lng"] as? Double ?? 0.0
//                                            let newLocation = Location(latitude: lat, longtitude: long, place_id: place_id)
//                                            print(newLocation)
//                                        }
//                                    }
//                                }
//                            }
//                        }
                        // end BT2:
                        // BT3: Sử dụng Decoder
                        let objectDecoder = try JSONDecoder().decode(ObjectFromServer.self, from: data)
                        print(objectDecoder)
                        // end BT3
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            })
        }
        // 6
        dataTask?.resume()
    }
    
    
    /*
     link course about animation ios swift 5
     https://www.udemy.com/course/coreanimation/
     link course about autolayout ios swift 5
     https://www.udemy.com/course/ios-auto-layout-swiftxcode/
     */
    
}
