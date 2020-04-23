//
//  CellXibVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/30/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class CellXibVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "CheckmarkCell", bundle: nil), forCellReuseIdentifier: "cellForCheckmark")
        
        tableView.dataSource = self
        //tableView.delegate = self
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
    }

}

extension CellXibVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForCheckmark") as! CheckmarkCell
        cell.lblTitle.text = data[indexPath.row].title
        
        cell.selectionStyle = .none
        cell.btnCheckmark.tag = indexPath.row
        cell.btnCheckmark.addTarget(self, action: #selector(checkmarkButtonClicked), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71.0
    }
    
    @objc func checkmarkButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            // đã config hình ảnh ở giao diện cho 2 state ( default và selected)
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
}


