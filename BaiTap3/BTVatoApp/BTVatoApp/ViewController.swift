//
//  ViewController.swift
//  BTVatoApp
//
//  Created by user159518 on 12/13/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.tableview.sectionHeaderHeight = 300
    }
}
// https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-section-header-to-a-table-view
//https://stackoverflow.com/questions/31964941/swift-how-to-make-custom-header-for-uitableview
//https://www.youtube.com/watch?v=17D02pD1weU

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? TableViewCell_Category else {
            fatalError("Unable to create main table view cell")
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ""
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 300))
        let image = UIImage(named: "food1.jpg")
        let imView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 300))
        imView.image = image
        view.addSubview(imView)
        return view
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

