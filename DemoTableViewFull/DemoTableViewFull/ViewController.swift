//
//  ViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/16/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Food] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = data[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

