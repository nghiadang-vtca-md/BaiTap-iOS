//
//  AViewController.swift
//  DemoSegue
//
//  Created by iMac_VTCA on 11/29/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
        createButton()
    }
    
    private func createButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        button.setTitle("Move to view", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(moveToView), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc private func moveToView() {
        let bVC = BViewController()
        // thể hiện bằng Present Modally
        //self.present(bVC, animated: true, completion: nil)
        
        // thể hiện bằng Show (Push)
        // thêm Navigation mặc định ở SceneDelegate
        self.navigationController?.pushViewController(bVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
