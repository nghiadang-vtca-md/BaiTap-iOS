//
//  ViewController.swift
//  BTLoadImageFromServer
//
//  Created by iMac_VTCA on 12/18/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBAction func btnLoad_Click(_ sender: UIButton) {
        let urlString = "http://lorempixel.com/400/200/"
        //let urlString = "https://fsmedia.imgix.net/07/05/10/11/b2e4/4575/937c/7b9a134d6ae4/5pikachu-1gif.gif?rect=0%2C0%2C1000%2C500&auto=compress&dpr=2&w=650&fm=jpg"
        guard let url = URL(string: urlString) else { return }
        
//        if let data = try? Data(contentsOf: url) {
//            myImageView.image = UIImage(data: data)
//        }
        
        do {
            let data = try Data(contentsOf: url)
            myImageView.image = UIImage(data: data)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    /*
     Fix lỗi không load được http
     - file "Info.plist" ->
                Chọn Information Property List
                    Chọn dấu thêm mới -> Search "App Transport Security Settings" -> mở dấu tam giác TRỎ XUỐNG
                        tiếp tục chọn dấu thêm mới -> Search "Allow Arbitrary Loads" -> set giá trị là "YES"
     */

}

