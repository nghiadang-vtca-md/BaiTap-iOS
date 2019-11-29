//
//  Push_Screen1_VC.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/29/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class Push_Screen1_VC: UIViewController {

    @IBAction func moveNext(_ sender: UIButton) {
        // tên identifier này là tên của segue
        self.performSegue(withIdentifier: "moveToScreen2", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /* Lưu ý
     - muốn thể hiện được loại segue là SHOW (push)
        Cách 1: chọn từ giao diện
            EDITOR -> EMBEB IN -> navigation controller
        Cách 2:
            Kéo thả "Navigation Controller" từ Library
            Xoá table mặc định
            Giữ phím "control" kéo đến màn hình cần làm root view
            Chọn "Relationship Segue" là "root view controller"
     - fix lỗi không hiện "Navigation bar" (chứa nút Back á)
        lý do là vì "Navigation Controller" phải được mặt định chạy đầu tiên
     - Giải thích cơ chế PUSH
        từng màn hình được xếp vào "Navigation Stack"
        | ......... |
        |-----------|
        | Third_VC  |
        |-----------|
        | Second_VC |
        |-----------|
        | First_VC  | <-- Root
        |-----------|
    */

}
