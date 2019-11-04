//
//  ViewController19.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/4/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController19: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let array1 = [1,2,3,4,5,6,7,8,9,10]
    let array2 = ["a","b","c","d","e"]
    let array3 = ["!","@"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell") // khai báo vùng nhớ lần đầu để tái sử dụng
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createBlueView()
    }
    

    /*
    Cần dataSource và Delegate giống UIPickerView
     
    */
    
    
    @IBAction func testButton(_ sender: Any) {
        
//        let indexPath = IndexPath(row: 1, section: 1)
//        let cell = myTableView.cellForRow(at: indexPath)
//        let value = cell?.textLabel?.text ?? "123123213213"
//        print("my value = \(value)")
//
//        if let myCell = cell, let newIndexPath = myTableView.indexPath(for: myCell){
//
//            print("section = \(newIndexPath.section) row = \(newIndexPath.row)")
//        }
        
        let point = CGPoint(x: 50, y: 250)
        let view = UIView(frame: CGRect(x: 50, y: 250, width: 1, height: 1))
        view.backgroundColor = .red
        myTableView.addSubview(view)
        if let indexPathPoint = myTableView.indexPathForRow(at: point) {
            
            print("section = \(indexPathPoint.section) row = \(indexPathPoint.row)")
        }
        
        
//        let rect = CGRect(x: 50, y: 250, width: 10, height: 100)
//        let view1 = UIView(frame: rect)
//        view1.backgroundColor = .blue
//        self.view.addSubview(view1)
        if let indexPathPRect = myTableView.indexPathsForRows(in: blueView.frame
            ) {

            print((indexPathPRect))
            //print("section = \(indexPathPoint.section) row = \(indexPathPoint.row)")
        }
    }
    
    
    var blueView:UIView!
    func createBlueView() {
        let rect = CGRect(x: 50, y: 250, width: 10, height: 100)
        blueView = UIView(frame: rect)
        blueView.backgroundColor = .blue
        self.view.addSubview(blueView)
    }
    
    
}

extension ViewController19: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { // mặc định trả về 1 nếu không khai báo
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowReutrn = 0
        switch section {
        case 0:
            rowReutrn = array1.count
        case 1:
            rowReutrn = array2.count
        case 2:
            rowReutrn = array3.count
        default:
            rowReutrn = 0
            print("Something's wrong!")
        }
        return rowReutrn
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath gồm có section và row hiện tại
        let currentSection = indexPath.section
        let currentRowOfSection = indexPath.row
        
        //let text = "section = \(currentSection); row = \(currentRowOfSection)"
        let text = getTextFromArray(section: currentSection, row: currentRowOfSection)
//        print(text)
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
//        }
//
//        cell?.imageView?.image = UIImage(named: "up.png")
//        cell?.textLabel?.text = text
//        cell?.detailTextLabel?.text = "123" // tại sao không hiển thị được ???
//        return cell!
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        
        cell.imageView?.image = UIImage(named: "up.png")
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = "123"
        
        return cell
    }
    
    func getTextFromArray(section: Int, row: Int) -> String {
        switch section {
        case 0:
            return String(array1[row])
        case 1:
            return String(array2[row])
        case 2:
            return String(array3[row])
        default:
            return ""
        }
    }
    
    
}
