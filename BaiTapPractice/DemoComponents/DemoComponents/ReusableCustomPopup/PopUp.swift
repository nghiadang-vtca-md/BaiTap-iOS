//
//  DatePopUpViewController.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/22/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class PopUp: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    var showTimePicker: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        if showTimePicker {
            titleLabel.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
    }
    
    // Lưu ý: Chọn viewcontroller cần popup
    // -> Attribute inspector
    // -> Presentation -> Over cover context ( không chọn thông qua segue, vì mở lên bằng programmatic cũng được)
    @IBAction func saveDate_TouchUpInside(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
