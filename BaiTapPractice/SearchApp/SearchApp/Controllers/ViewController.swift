//
//  ViewController.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/10/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let searchEndpoint = Itunes.search(term: "taylor swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
        print(searchEndpoint.request)
        
        let lookupEndpoint = Itunes.lookup(id: 159260315, entity: MusicEntity.album)
        print(lookupEndpoint.request)
    }


}

