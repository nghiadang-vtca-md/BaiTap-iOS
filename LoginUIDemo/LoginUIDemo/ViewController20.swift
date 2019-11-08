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
        myTableView.delegate = self
    }
    

    /*
    Cách 1: kéo thả cell vào table view (không cần phải register)
     - đặt tên cho identifer của Table View Cell ( vd: "myCustomCell" )
     - Tạo 1 file swift mới để xử lý cho View Cell (lúc tạo nhớ chọn là sub của UITableViewCell )
     - thiết lập ở IDENTITY INSPECTOR -> class chọn là file vừa tạo
     - Kéo thả các components vào file vừa tạo
     - ở tableView của Datasource -> cast qua kiểu file vừa tạo (thay vì là UITableViewCell)
     - cài đặt datasource = self
     
     Cách 2: tạo bằng code rồi thêm bằng "register"
     - xem lại màn hình trước
     
     
     
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
        
        // Cách 1:
//        customCell.lblName.text = currentFruit.name
//        customCell.lblDescription.text = currentFruit.description
//        customCell.imgView.image = UIImage(named: currentFruit.image)
        
        // Cách 2: chia code xử lý về cell (file TableViewCell.swift)
        customCell.visualizeCell(item: currentFruit)
        // Cách 3: xem code viewcontroller21
        
        
        // accessory type
        //customCell.accessoryType = .detailButton
        
        // tạo accessoryView bằng code
        let buttonAccessory = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        buttonAccessory.backgroundColor = .cyan
        buttonAccessory.setTitle("+", for: .normal)
        customCell.accessoryView = buttonAccessory
        //customCell.btnChoose.isHidden = true
        // end tạo accessoryView bằng code
        
       
        
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

extension ViewController20: UITableViewDelegate {
    // hàm này gọi trước hàm func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    // nếu trả về nill thì sẽ không vô hàm tiếp theo
    // cái này dùng để check điều kiện để không xử lý những row cần thiết
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
        //return nil
    }
    
    // khi row được selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        let isSelected = cell?.isSelected ?? false
        //let isHighlighted = cell?.isHighlighted ?? false
        
//        cell?.setSelected(<#T##selected: Bool##Bool#>, animated: <#T##Bool#>)
//        cell?.setHighlighted(<#T##highlighted: Bool##Bool#>, animated: <#T##Bool#>)
        
        if isSelected {
            if cell?.backgroundColor == .cyan {
                tableView.deselectRow(at: indexPath, animated: true)
                cell?.backgroundColor = .white
            } else {
                cell?.backgroundColor = .cyan
            }
        } else {
            if cell?.backgroundColor == .yellow {
                tableView.deselectRow(at: indexPath, animated: true)
                cell?.backgroundColor = .white
            } else {
                cell?.backgroundColor = .yellow
            }
        }
               
        
        print(isSelected)
        //print(isHighlighted)
    }
    
    // gọi trước khi cell display
    // giải quyết vấn đề LOAD MORE
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // ví dụ mỗi lần load 50 items từ server về
        // check điều kiện indexPath = 40 thì gọi hàm "LOAD MORE" để kéo thêm 50 items về nữa
        print(indexPath)
    }
    // sau khi display xong thì vô được hàm này
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    // thiết lập chiều cao cho row
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.row {
//        case 0:
//            return 50
//        case 1:
//            return 70
//        case 2:
//            return 100
//        case 3:
//            return 140
//        default:
//            print("something's wrong!")
//        }
//        return 0
//    }
}
