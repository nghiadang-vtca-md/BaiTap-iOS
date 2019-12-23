//
//  ViewController.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/18/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import UIKit

let API_URL = "http://omdbapi.com/?apikey=7882463&s=batman"

struct Movie {
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var poster: String
    
    init(with dict: [String: Any]) {
        title = dict["Title"] as? String ?? ""
        year = dict["Year"] as? String ?? ""
        imdbID = dict["imdbID"] as? String ?? ""
        type = dict["Type"] as? String ?? ""
        poster = dict["Poster"] as? String ?? ""
    }
}

struct SearchItem: Codable {
    var Search: [MovieNew]
}

struct MovieNew: Codable {
    var Title: String
    var Year: String
    var imdbID: String
    var `Type`: String
    var Poster: String
}


class ViewController: UIViewController {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    var arrayMovie: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAPI()
    }


    private func requestAPI() {
        //1
        dataTask?.cancel()
        
        
        // 2
        if var urlComponents = URLComponents(string: "http://omdbapi.com/") {
            urlComponents.query = "apikey=7882463&s=batman"
            
            // 3
            guard let url = urlComponents.url else {
                return
            }
            
            //4
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                
                
                //5
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data,
                                let response = response as? HTTPURLResponse,
                                response.statusCode == 200 {
                    
                    do {
                        
                        let jsonString = """
                        [
                            {
                                "Title": "Batman Begins",
                                "Year": "2005",
                                "imdbID": "tt0372784",
                                "Type": "movie",
                                "Poster": "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg"
                            }, {
                                "Title": "Batman v Superman: Dawn of Justice",
                                "Year": "2016",
                                "imdbID": "tt2975590",
                                "Type": "movie",
                                "Poster": "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
                            }, {
                               "Title": "Batman",
                                "Year": "1989",
                                "imdbID": "tt0096895",
                                "Type": "movie",
                                "Poster": "https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg"
                            }
                        ]
                        """
                        let newData = jsonString.data(using: .utf8)!
                        let newUser = try! JSONDecoder().decode([MovieNew].self, from: newData)
//                        let newUser
                        
                        let user = try! JSONDecoder().decode(SearchItem.self, from: data)
                        
                        let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    
                        if let dictionary = object as? [String: Any] {
                            
//                            let jsonData = jsonString.data(using: .utf8)!
//                            let user = try! JSONDecoder().decode(User.self, from: jsonData)
//                            print(user.last_name)
                    
                            if let arraySearchDict = dictionary["Search"] as? [[String: Any]] {
                                for dict in arraySearchDict {
//                                    "Title": "Batman Begins",
//                                    "Year": "2005",
//                                    "imdbID": "tt0372784",
//                                    "Type": "movie",
//                                    "Poster": "https:
                                    
                                    let model = Movie(with: dict)
                                
                                    
//                                    let model = Movie(title: title, year: year, imdbID: imdbID, type: type, poster: poster)
                                    self.arrayMovie.append(model)
                                }
                            }
                            
                            print(self.arrayMovie)
                            
                        }
                    } catch {
                        
                    }
                    
                    print("Success")
                }
            })
            
            //7
            dataTask?.resume()
        }
        
    }
}

