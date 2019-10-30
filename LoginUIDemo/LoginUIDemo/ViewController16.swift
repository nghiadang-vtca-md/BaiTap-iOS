//
//  ViewController16.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/30/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController16: UIViewController {
    
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var pickerViewImage: UIPickerView!
    
    var currentRow = 0
    
    let arraySubject = ["Lập trình iOS", "Lập trình Android", "Lập trình Web", "Lập trình nhúng"]
    let arrayTime = ["Sáng" , "Tối"]
    let arrayTime1 = ["Sáng T2", "Chiều T4", "Tối T2"]
    let arrayTime2 = ["Tối 3-5-7"]
    let arrayTime3 = ["Sáng 3-5", "Chiều 2-4-6", "Tối 3-5"]
    
    
    let arrayImageFood: [UIImage?] = [UIImage(named: "1.jpeg"), UIImage(named: "2.jpeg"),UIImage(named: "3.jpeg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myPickerView.delegate = self // Cách khác là kéo delegate của Picker vào ViewController16
        myPickerView.dataSource = self //Cách khác là kéo dataSource của Picker vào ViewController16
        myPickerView.tag = 1
        
        pickerViewImage.delegate = self
        pickerViewImage.dataSource = self
        pickerViewImage.tag = 2
    }
    

   /* Note:
     - áp dụng protocol UIPickerViewDataSource và UIPickerViewDelegate
     
     - nhớ thiết lập DELEGATE cho Picker vào ViewController
     - nhớ thiết lập DATASOURCE cho Picker vào ViewController
     - cơ chế binding thiết lập theo cách THỦ CÔNG
       + tạo biến currentRow (được gán ở UIPickerViewDelegate) để lưu row được chọn để binding
       + nhớ reload pickerView.reloadComponent(1)
     */

}

extension ViewController16: UIPickerViewDataSource {
    // set số column khi khởi tạo
    func numberOfComponents(in pickerView: UIPickerView) -> Int { // component là column
        if pickerView.tag == 1 {
             return 2
        } else if pickerView.tag == 2 {
            return 1
        }
        return 0
    }
    // set số row cho mỗi column ( ví dụ này có binding: nên mỗi row của column 0 được select -> sẽ sinh ra một column tương ứng
    //
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
             if component == 0 { // column 0
                 return arraySubject.count
             } else { // column 1
                 switch currentRow {
                 case 0:
                     return arrayTime.count
                 case 1:
                     return arrayTime1.count
                 case 2:
                     return arrayTime2.count
                 case 3:
                     return arrayTime3.count
                 default:
                     return 0
                 }
             }
        } else if pickerView.tag == 2 {
            return arrayImageFood.count
        }
        return 0
    }
    
    
}

extension ViewController16: UIPickerViewDelegate {
    // hàm này để đổ dữ liệu lên UI
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
             if component == 0 {
                 let item = arraySubject[row]
                 return item
             }
             else {
                 switch currentRow {
                 case 0:
                     return arrayTime[row]
                 case 1:
                     return arrayTime1[row]
                 case 2:
                     return arrayTime2[row]
                 case 3:
                     return arrayTime3[row]
                 default:
                     return ""
                 }
             }
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return UIImageView(image: arrayImageFood[row])
    }
    
    // hàm này lấy row được select từ user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
             if component == 0 {
                 print(arraySubject[row])
                 currentRow = row
                 pickerView.reloadComponent(1)
             } else {
                 switch currentRow {
                 case 0:
                     print(arrayTime[row])
                 case 1:
                     print(arrayTime1[row])
                 case 2:
                    print(arrayTime2[row])
                 case 3:
                    print(arrayTime3[row])
                 default:
                     print("Something's wrong!")
                 }
             }
        } else if pickerView.tag == 2 {
            print(arrayImageFood[row]!)
        }
        
    }
    
}
