//
//  ViewController14.swift
//  LoginUIDemo
//
//  Created by user159518 on 10/30/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController14: UIViewController {
    @IBOutlet weak var lblTimerDisplay: UILabel!
    @IBOutlet weak var btnStartStopResume: UIButton!
    @IBOutlet weak var btnLapReset: UIButton!
    @IBOutlet weak var tvResultLap: UITextView!
    
    @IBAction func btn_action_tap(_ sender: UIButton) {
        //print(sender.titleLabel?.text)
        switch sender.titleLabel?.text {
        case "Start":
            print("Start")
            actionStart()
        case "Stop":
            print("Stop")
            actionStop()
        case "Resume":
            print("Resume")
            actionResume()
        case "Lap":
            print("Lap")
            actionLap()
        case "Reset":
            print("Reset")
            actionReset()
        default:
            print("Something's wrong")
        }
    }
    
    var timer:Timer?
    var timeTracking = 0  // second
    var timeToResume = 0
    var resultLap = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func actionStart() {
        btnStartStopResume.setTitle("Stop", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires()
    {
        timeTracking += 1
        //timeLabel.text = "\(timeLeft) seconds left"
        print(timeTracking)
        lblTimerDisplay.text = convertToTimeDisplay(second: timeTracking)
    }
    
    func actionStop() {
        if let t = timer {
            t.invalidate()
            timer = nil
            timeToResume = timeTracking
            btnStartStopResume.setTitle("Resume", for: .normal)
            btnLapReset.setTitle("Reset", for: .normal)
        }
        
    }
    
    func actionResume() {
        timeTracking = timeToResume
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        btnStartStopResume.setTitle("Stop", for: .normal)
        btnLapReset.setTitle("Lap", for: .normal)
    }
    
    func actionReset() {
        btnStartStopResume.setTitle("Start", for: .normal)
        btnLapReset.setTitle("Lap", for: .normal)
        tvResultLap.text = ""
        lblTimerDisplay.text = "00:00:00"
        timeTracking = 0
        resultLap = ""
    }
    
    func actionLap() {
        print(convertToTimeDisplay(second: timeTracking))
        resultLap += convertToTimeDisplay(second: timeTracking) + "\n"
        tvResultLap.text = resultLap
        
    }
    
    func convertToTimeDisplay(second: Int) -> String{
        var hh = "00"
        var mm = "00"
        var ss = "00"
        
        let s: Int = second % 60
        let m: Int = (second % 3600) / 60
        let h: Int = second / 3600
        
        hh = h < 10 ? "0\(h)" : String(h)
        mm = m < 10 ? "0\(m)" : String(m)
        ss = s < 10 ? "0\(s)" : String(s)
        
        print("\(hh):\(mm):\(ss)")
        
        return "\(hh):\(mm):\(ss)"
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
