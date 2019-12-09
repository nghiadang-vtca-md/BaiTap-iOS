//
//  ViewController.swift
//  ListAddApp
//
//  Created by iMac_VTCA on 12/9/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

struct MyCellData {
    var title: String
    var description: String
}



class ViewController: UIViewController {

    
    @IBOutlet weak var myTableview: UITableView!
    
    
    @IBAction func add_click(_ sender: UIButton) {
        
    }
    
    var data: [MyCellData] = [MyCellData(title: "Title 1", description: "Description 111 111 111 111 111 111 222 222 222"),
        MyCellData(title: "Title 2", description: "Description 222 111 111 111 111 111 222 222 222 222 111 111 111 111 111 222 222 222")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableview.dataSource = self
        
        
        let nib = UINib(nibName: "tbvCell", bundle: nil)
        // cách 1
        //myTableview.register(nib, forCellReuseIdentifier: "myCell")
        // cách 2
        myTableview.register(nib, forCellReuseIdentifier: "tbvCell")
        // Chú ý lỗi autolayout ở file .xib
        // cell thiết kế phải đúng kích cỡ chứa các thuộc tính
        // việc dãn dài text là do autolayout ở table view quyết định
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewController2 {
            controller.myDelegate = self
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cách 1:
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? tbvCell else {
//            return UITableViewCell()
//        }
        // cách 2:
        let cell = tbvCell.createCell(tableView: tableView)
        
        let dataCell = data[indexPath.row]
        cell.tfTitle.text = dataCell.title
        cell.tfDescription.text = dataCell.description
        return cell
    }
    
    
}

extension ViewController: CallBackDelegate {
    func addItemFinished(title: String, description: String) {
        self.data.append(MyCellData(title: title, description: description))
        myTableview.reloadData()
    }
}

// Cách 2 tạo cell
protocol Cell {
    static var identify: String { get }
}

extension Cell {
    static var identify: String {
        return "\(self)"
    }
}
// lưu ý file tbvCell phải áp dụng protocol Cell
extension Cell where Self: UITableViewCell {
    static func createCell(tableView: UITableView) -> Self {
        return tableView.dequeueReusableCell(withIdentifier: self.identify) as! Self
        // lưu ý withIdentifier
        // là tên file MyCell.swift và tên ở phần identifier thiết lập cho cell
    }
}

//extension Cell where Self: UICollectionViewCell {
//    static func createCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: self.identify, for: indexPath) as! Self
//        // lưu ý withIdentifier
//        // là tên file MyCell.swift và tên ở phần identifier thiết lập cho cell
//    }
//}

