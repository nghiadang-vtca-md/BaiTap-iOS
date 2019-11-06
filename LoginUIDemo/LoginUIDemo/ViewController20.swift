//
//  ViewController20.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/6/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

struct FruitItem {
    let name: String
    let description: String
    let image: String
}

class ViewController20: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    
    var arrayItem: [FruitItem] = [FruitItem(name: "Dua hau", description: "Mai An Tiem", image: "duahau.jpg"),
    FruitItem(name: "Xoai", description: "Cat Hoa Loc", image: "xoai.jpg"),
    FruitItem(name: "Sau Rieng", description: "Cai Mon", image: "saurieng.jpg"),
    FruitItem(name: "Nho", description: "Uc mau xanh", image: "nho.jpeg")]
    
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let newItem = FruitItem(name: "Tao", description: "My khong hot", image: "tao.jpg")
        
//        arrayItem.append(newItem)
//        myTableView.reloadData() // xoá tất cả rồi mới vẽ lại
        
        // binding add
        arrayItem.append(newItem)
        let newIndexPath = IndexPath(row: arrayItem.count - 1, section: 0)
        myTableView.beginUpdates()
        myTableView.insertRows(at: [newIndexPath], with: .left)
        myTableView.endUpdates()
        
        myTableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
    }
    
    @IBAction func btnEdit_HardCodeDemo(_ sender: UIButton) {
        let newItemToEdit = FruitItem(name: "Dao", description: "Trung Quoc noi dia", image: "dao.jpeg")
        // Đổi sầu riêng thành Đào
        arrayItem[2] = newItemToEdit
        myTableView.beginUpdates()
        myTableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .right)
        myTableView.endUpdates()
    }
    
    
    @IBAction func btnEdit_Setting(_ sender: UIButton) {
        // setup Editing ở Datasource
        let textButton = sender.titleLabel?.text
        if textButton == "Edit" {
            sender.setTitle("Done", for: .normal)
            myTableView.setEditing(true, animated: true)
        } else {
            sender.setTitle("Edit", for: .normal)
            myTableView.setEditing(false, animated: true)
        }
        print(arrayItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTableView.dataSource = self
    }
    

    /*
    Cách 1: kéo thả cell vào table view (không cần phải register)
     - đặt tên cho identifer của Table View Cell ( vd: "myCustomCell" )
     - Tạo 1 file swift mới để xử lý cho View Cell (lúc tạo nhớ chọn là sub của UITableViewCell )
     - thiết lập ở IDENTITY INSPECTOR -> class chọn là file vừa tạo
     - Kéo thả các components vào file vừa tạo
     - ở tableView của Datasource -> cast qua kiểu file vừa tạo (thay vì là UITableViewCell)
     - cài đặt datasource = self
     
     Cách 2:
     
     Fix lỗi mặc định row height cell = 44px
     - Size inspector của TableView -> Chọn kích thước cho "Row height"
     - Ở TableViewCell -> cũng chọn height là giống với tableview
     
     
    */

}

extension ViewController20: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentFruit = arrayItem[indexPath.row]
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell",for: indexPath) as? ViewController20_CustomViewCellTableViewCell else {
            return UITableViewCell()
        }
        
        customCell.lblName.text = currentFruit.name
        customCell.lblDescription.text = currentFruit.description
        customCell.imgView.image = UIImage(named: currentFruit.image)
        
        return customCell
    }
    
    // Editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // dòng 1 và 2 không được phép edit
        let row = indexPath.row
        if row == 1 || row == 2 {
            return false
        }
        return true
    }
    
    // Moving/reordering
    
    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Data manipulation - reorder / moving support
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let rowSource = sourceIndexPath.row
        let item = arrayItem[rowSource]
        
        arrayItem.remove(at: rowSource)
        
        let rowDes = destinationIndexPath.row
        arrayItem.insert(item, at: rowDes)
    }

}
