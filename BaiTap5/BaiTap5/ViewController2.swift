//
//  ViewController2.swift
//  BaiTap5
//
//  Created by iMac_VTCA on 1/10/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit

protocol crudDelegate {
    func saveItem(note: Note)
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    
    var delegate: crudDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton_Clicked(_ sender: UIButton) {
        var currentDate = Date()
 
 
// 1) Create a DateFormatter() object.
let format = DateFormatter()
 
// 2) Set the current timezone to .current, or America/Chicago.
format.timeZone = .current
 
// 3) Set the format of the altered date.
format.dateFormat = "dd-MM-yyyy HH:mm:ss"
 
// 4) Set the current date, altered by timezone.
let dateString = format.string(from: currentDate)
        
        let id = UUID().uuidString
        let title = tfTitle.text ?? ""
        let description = tfDescription.text ?? ""
        let lat: Float = 0.0
        let long: Float = 0.0
        let newNote = Note(id: id, title: title, description: description, latitude: lat, longitude: long, dateCreated: dateString)
        delegate?.saveItem(note: newNote)
        
        self.dismiss(animated: true, completion: nil)
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
