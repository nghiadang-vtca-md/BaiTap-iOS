//
//  ViewController.swift
//  DemoUsingCocoaPods
//
//  Created by iMac_VTCA on 1/3/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AF.request("https://itunes.apple.com/search?media=music&entity=song&term=happy%20new%20year").response { (respone) in
            debugPrint(respone)
            
            if let error = respone.error {
                print(error.localizedDescription)
            } else if let data = respone.data {
                var dictionary: [String: Any]?
                
                do {
                    dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch let parseError as NSError {
                    print(parseError.localizedDescription)
                    return
                }
                
                guard let array = dictionary!["results"] as? [Any] else {
                    print("Dictionaries does not contain results key\n")
                    return
                }
                
                for trackDictionary in array {
                    if let track = trackDictionary as? [String: Any], let previewURL = track["previewUrl"] as? String {
                        print(previewURL)
                    }
                }
            }
        }
    }


}

/*
 - Cai HomeBrew
 - Cai CocoaPods
 - Tao pod init
 - add thu vien -> pod install
 - Luu y: ignore folder Pods khi upload code
 
 */

