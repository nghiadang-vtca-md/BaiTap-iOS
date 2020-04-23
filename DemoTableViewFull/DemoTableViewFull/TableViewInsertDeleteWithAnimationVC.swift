//
//  TableViewInsertDeleteWithAnimationVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/19/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class TableViewInsertDeleteWithAnimationVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!

    var data: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
       
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
    }
    
    @IBAction func addRow(_ sender: UIButton) {
        if data.count != 0 {
            data.insert(Food(title: "Orange", subtitle: "Consuming vitamin C supplements does not provide the same protective benefits as drinking a glass of orange juice.", image: #imageLiteral(resourceName: "oranges_small.jpg"), fullImage: #imageLiteral(resourceName: "oranges.jpg")), at: 0)
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            self.addButton.isHidden = true
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
                cell?.contentView.flash(numberOfFlashes: 3)
                self.addButton.isHidden = false
            }
        } else {
            data.insert(Food(title: "Orange", subtitle: "Consuming vitamin C supplements does not provide the same protective benefits as drinking a glass of orange juice.", image: #imageLiteral(resourceName: "oranges_small.jpg"), fullImage: #imageLiteral(resourceName: "oranges.jpg")), at: 0)
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
        }
        
        
    }
    
    @objc func deleteRow(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: self.tableView)
        print(self.tableView.frame.origin)
        print(point)
        guard let indexPath = self.tableView.indexPathForRow(at: point) else {
            return
        }
        
        data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
    }

}

extension UIView {
    func flash(numberOfFlashes: Float) {
          let flash = CABasicAnimation(keyPath: "opacity")
          flash.duration = 0.2
          flash.fromValue = 1
          flash.toValue = 0.1
          flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
          flash.autoreverses = true
          flash.repeatCount = numberOfFlashes
          layer.add(flash, forKey: nil)
      }
}

extension TableViewInsertDeleteWithAnimationVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let itemFood = data[indexPath.row]
        
        if let textLabel = cell?.contentView.viewWithTag(101) as? UILabel {
            textLabel.text = itemFood.title
        }
        
        if let btnDelete = cell?.contentView.viewWithTag(102) as? UIButton {
            btnDelete.addTarget(self, action: #selector(deleteRow(_ :)), for: .touchUpInside)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    

}

extension TableViewInsertDeleteWithAnimationVC: UITableViewDelegate {
    
}




