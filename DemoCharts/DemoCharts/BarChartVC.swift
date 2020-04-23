//
//  BarChartVC.swift
//  DemoCharts
//
//  Created by nghiadang1205 on 3/30/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit

struct SwiftNewsVideo {
    var showNumber: String
    var viewCount: Double
}

class BarChartVC: UIViewController {
    
    @IBOutlet weak var chartView: MacawChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        chartView.contentMode = .scaleAspectFit
    }
    

    @IBAction func showChartButtonTapped(_ sender: UIButton) {
        MacawChartView.playAnimations()
    }

}
