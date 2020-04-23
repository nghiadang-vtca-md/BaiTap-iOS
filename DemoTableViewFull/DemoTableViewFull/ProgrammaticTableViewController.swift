//
//  ProgrammaticTableViewController.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/16/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ProgrammaticTableViewController: UIViewController {

    /*
     Lưu ý cấu hình lại phần SceneDelegate để chạy file này trước tiên
     
     guard let windowScene = (scene as? UIWindowScene) else { return }
     
     // dành cho phần ProgrammaticTableView
     window = UIWindow(frame: windowScene.coordinateSpace.bounds)
     window?.windowScene = windowScene
     window?.rootViewController = ProgrammaticTableViewController()
     window?.makeKeyAndVisible()
     // end
     
     */
    
    lazy var tableView: UITableView = {
       let v = UITableView()
        v.dataSource = self
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
    
    var data: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
        self.title = "Programmatic TableView Controller"
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }

}

extension ProgrammaticTableViewController: UITableViewDataSource, UITableViewDelegate {
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
