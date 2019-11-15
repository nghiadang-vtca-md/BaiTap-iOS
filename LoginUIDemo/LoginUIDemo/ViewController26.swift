//
//  ViewController26.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/15/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController26: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    
    @IBAction func chooseImage(_ sender: UIButton) {
        let pickerView = UIImagePickerController()
        pickerView.sourceType = .photoLibrary
        pickerView.delegate = self
        //pickerView.mediaTypes = ["media.image"]
        pickerView.allowsEditing = true // cho phép chỉnh sửa
        self.present(pickerView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension ViewController26: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("did finish")
        picker.dismiss(animated: true, completion: nil) // phải setup bằng tay
        if let image = info[.editedImage] as? UIImage {
            myImage.image = image
            //print(info[.imageURL])
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel")
        picker.dismiss(animated: true, completion: nil) // phải setup bằng tay
    }
}
