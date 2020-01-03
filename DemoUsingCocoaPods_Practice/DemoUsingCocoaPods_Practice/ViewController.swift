//
//  ViewController.swift
//  DemoUsingCocoaPods_Practice
//
//  Created by iMac_VTCA on 1/3/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit
import Alamofire

//let API_URL = "https://maps.googleapis.com/maps/api/geocode/json?latlng=10.802184,106.686711&output=json&key=AIzaSyD4S0Qu29xxQsOLCPzGBWacF_2ugvu0QoQ"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("https://maps.googleapis.com/maps/api/geocode/json?latlng=10.802184,106.686711&output=json&key=AIzaSyD4S0Qu29xxQsOLCPzGBWacF_2ugvu0QoQ").response { (response) in
            //debugPrint(response)
            
            if let error = response.error {
                print(error.localizedDescription)
            } else if let data = response.data {
                var dictionary: [String: Any]?
                
                do {
                    dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print(error.localizedDescription)
                }
                
                if let array = dictionary!["results"] as? [[String: Any]]  {
                    for dict in array {
                        let place_id = dict["place_id"] as? String ?? ""
                        print("\(place_id)\n")
                    }
                }
                
                
            }
        }
    }


}

