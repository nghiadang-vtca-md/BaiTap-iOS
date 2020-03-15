//
//  SimpleMVVMVC.swift
//  DemoMVVMDesignPattern
//
//  Created by nghiadang1205 on 3/9/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class SimpleMVVMVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = SimpleListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Simple MVVM"
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SimpleMVVMVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellModel", for: indexPath) as? SimpleMVVMCell else {
            fatalError()
        }
        
        cell.data = viewModel.getModelAt(indexPath.row)
        
        return cell
    }
    
    
}

extension SimpleMVVMVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
}
