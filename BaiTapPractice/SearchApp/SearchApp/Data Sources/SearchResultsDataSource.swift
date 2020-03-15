//
//  SearchResultsDataSource.swift
//  SearchApp
//
//  Created by nghiadang1205 on 3/11/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {

    private var data = [Artist]()
    
    override init() {
        super.init()
    }

    func update(with artists: [Artist]) {
        self.data = artists
    }
    
    // MARK: - Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        let artist = self.data[indexPath.row]
        
        cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // MARK: - Helpers
    func artist(at indexPath: IndexPath) -> Artist {
        return self.data[indexPath.row]
    }
}
