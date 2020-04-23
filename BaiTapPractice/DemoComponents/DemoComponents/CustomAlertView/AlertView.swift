//
//  AlertView.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/21/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    static let instance = AlertView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    // Ở file .xib chọn class file's owner là "AlertView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implement")
    }
    
    private func commonInit() {
        alertView.layer.cornerRadius = 10
        
        img.layer.cornerRadius = 30
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        
        print(UIScreen.main.bounds.width)
        print( UIScreen.main.bounds.height)
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    enum AlertType {
        case success
        case failure
    }
    
    func showAlert(title: String, message: String, alertType: AlertType) {
        self.titleLbl.text = title
        self.messageLbl.text = message
        
        switch alertType {
        case .success:
            img.image = UIImage(named: "success")
            doneButton.backgroundColor = UIColor.green
        case .failure:
            img.image = UIImage(named: "failure")
            doneButton.backgroundColor = UIColor.systemGreen
        }
    // Lưu ý phải setup đúng ParentView ( xem lại cây )
    UIApplication.shared.windows.first?.addSubview(parentView)
//        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.last
//        keyWindow?.addSubview(parentView)
    }
    
    
    
    @IBAction func onClickDone(_ sender: Any) {
        parentView.removeFromSuperview()
    }
}
