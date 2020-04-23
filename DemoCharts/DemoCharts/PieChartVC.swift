//
//  FirstViewController.swift
//  DemoCharts
//
//  Created by nghiadang1205 on 3/30/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit
import Charts

class PieChartVC: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var macStepper: UIStepper!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadDataEntries = [PieChartDataEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pieChart.chartDescription?.text = ""
        
        iosDataEntry.value = iosStepper.value
        //iosDataEntry.label = "iOS"
        
        macDataEntry.value = macStepper.value
        //macDataEntry.label = "macOS"
        
        numberOfDownloadDataEntries = [iosDataEntry, macDataEntry]
        
        updateChartData()
    }
    
    @IBAction func changeiOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
    }

    @IBAction func changeMac(_ sender: UIStepper) {
        macDataEntry.value = sender.value
        updateChartData()
    }

    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor.red, UIColor.blue]
        chartDataSet.colors = colors
        
        pieChart.data = chartData
    }
}

