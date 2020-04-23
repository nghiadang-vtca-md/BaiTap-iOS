//
//  DetailViewController.swift
//  DemoCollectionView
//
//  Created by nghiadang1205 on 2/12/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedData: String?
    
    @IBOutlet weak var dataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let text = selectedData {
            dataLabel.text = text
            self.title = "\(text) detail"
        }
        
        
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
