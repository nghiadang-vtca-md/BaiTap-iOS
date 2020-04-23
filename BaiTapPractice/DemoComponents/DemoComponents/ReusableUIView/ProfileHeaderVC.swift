//
//  ProfileHeaderVC.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/29/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ProfileHeaderVC: UIViewController {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnEditProfile: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgAvatar.backgroundColor = UIColor.white
        imgAvatar.layer.cornerRadius = imgAvatar.frame.size.width / 2
        
        btnEditProfile.backgroundColor = UIColor.white
        btnEditProfile.layer.cornerRadius = 5.0
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        print("Edit profile button is tapped")
        let storyBoard = UIStoryboard(name: "ReusableUIView", bundle: nil)
        let editProfileVC = storyBoard.instantiateViewController(identifier: "EditProfileVC") as! EditProfileVC
        self.navigationController?.pushViewController(editProfileVC, animated: true)
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
