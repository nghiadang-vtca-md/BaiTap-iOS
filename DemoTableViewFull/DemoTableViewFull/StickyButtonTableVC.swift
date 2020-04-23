//
//  StickyButtonTableVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/18/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class StickyButtonTableVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Food] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @IBAction func didTapOnAddButton(sender: UIButton) {
        print("User tapped add")
    }

}

extension StickyButtonTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let itemFood = self.data[indexPath.row]
        cell?.textLabel?.text = itemFood.title
        cell?.detailTextLabel?.text = itemFood.subtitle
        cell?.imageView?.image = itemFood.image
        
        return cell!
    }
    
    
}

extension StickyButtonTableVC: UITableViewDelegate {
    
}
