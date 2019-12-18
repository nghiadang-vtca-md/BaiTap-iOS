//
//  ViewController.swift
//  DemoJSON
//
//  Created by iMac_VTCA on 12/18/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
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

class ViewController: UIViewController {

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var arrayMovie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestAPI()
    }

    private func requestAPI() {
        // 1
        dataTask?.cancel()
        // 2
        if var urlComponents = URLComponents(string: "http://omdbapi.com") {
            urlComponents.query = "apikey=7882463&s=batman"
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
                        let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        /*
                         Lưu ý: phân biệt response dictionary {} và response mảng dictionary [{}]
                         */
                        if let dictionary = object as? [String: Any] {
                            if let arraySearchDict = dictionary["Search"] as? [[String: Any]] {
                                for dict in arraySearchDict {
                                    let movie = Movie(with: dict)
                                    self.arrayMovie.append(movie)
                                }
                                print(self.arrayMovie)
                            }
                        }
                        
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            })
        }
        // 6
        dataTask?.resume()
        // Thứ tự chạy: 1 -> 2 -> 3 -> 4 -> 6 -> 5
    }
    
}

/*
 {"Search":[{"Title":"Batman Begins","Year":"2005","imdbID":"tt0372784","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg"},{"Title":"Batman v Superman: Dawn of Justice","Year":"2016","imdbID":"tt2975590","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"},{"Title":"Batman","Year":"1989","imdbID":"tt0096895","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg"},{"Title":"Batman Returns","Year":"1992","imdbID":"tt0103776","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg"},{"Title":"Batman Forever","Year":"1995","imdbID":"tt0112462","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNDdjYmFiYWEtYzBhZS00YTZkLWFlODgtY2I5MDE0NzZmMDljXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"},{"Title":"Batman & Robin","Year":"1997","imdbID":"tt0118688","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMGQ5YTM1NmMtYmIxYy00N2VmLWJhZTYtN2EwYTY3MWFhOTczXkEyXkFqcGdeQXVyNTA2NTI0MTY@._V1_SX300.jpg"},{"Title":"The Lego Batman Movie","Year":"2017","imdbID":"tt4116284","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg"},{"Title":"Batman: The Animated Series","Year":"1992–1995","imdbID":"tt0103359","Type":"series","Poster":"https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg"},{"Title":"Batman: Under the Red Hood","Year":"2010","imdbID":"tt1569923","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNmY4ZDZjY2UtOWFiYy00MjhjLThmMjctOTQ2NjYxZGRjYmNlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"},{"Title":"Batman: The Dark Knight Returns, Part 1","Year":"2012","imdbID":"tt2313197","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMzIxMDkxNDM2M15BMl5BanBnXkFtZTcwMDA5ODY1OQ@@._V1_SX300.jpg"}],"totalResults":"368","Response":"True"}
 */

/*
 {
   "Search": [
     {
       "Title": "Batman Begins",
       "Year": "2005",
       "imdbID": "tt0372784",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg"
     },
     {
       "Title": "Batman v Superman: Dawn of Justice",
       "Year": "2016",
       "imdbID": "tt2975590",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
     },
     {
       "Title": "Batman",
       "Year": "1989",
       "imdbID": "tt0096895",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg"
     },
     {
       "Title": "Batman Returns",
       "Year": "1992",
       "imdbID": "tt0103776",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg"
     },
     {
       "Title": "Batman Forever",
       "Year": "1995",
       "imdbID": "tt0112462",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BNDdjYmFiYWEtYzBhZS00YTZkLWFlODgtY2I5MDE0NzZmMDljXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"
     },
     {
       "Title": "Batman & Robin",
       "Year": "1997",
       "imdbID": "tt0118688",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BMGQ5YTM1NmMtYmIxYy00N2VmLWJhZTYtN2EwYTY3MWFhOTczXkEyXkFqcGdeQXVyNTA2NTI0MTY@._V1_SX300.jpg"
     },
     {
       "Title": "The Lego Batman Movie",
       "Year": "2017",
       "imdbID": "tt4116284",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg"
     },
     {
       "Title": "Batman: The Animated Series",
       "Year": "1992–1995",
       "imdbID": "tt0103359",
       "Type": "series",
       "Poster": "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg"
     },
     {
       "Title": "Batman: Under the Red Hood",
       "Year": "2010",
       "imdbID": "tt1569923",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BNmY4ZDZjY2UtOWFiYy00MjhjLThmMjctOTQ2NjYxZGRjYmNlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
     },
     {
       "Title": "Batman: The Dark Knight Returns, Part 1",
       "Year": "2012",
       "imdbID": "tt2313197",
       "Type": "movie",
       "Poster": "https://m.media-amazon.com/images/M/MV5BMzIxMDkxNDM2M15BMl5BanBnXkFtZTcwMDA5ODY1OQ@@._V1_SX300.jpg"
     }
   ],
   "totalResults": "368",
   "Response": "True"
 }
 */

