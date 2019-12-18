//
//  ViewController4.swift
//  FileDemo
//
//  Created by iMac_VTCA on 12/16/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController4: UIViewController {
    
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var sliderDuration: UISlider!
    @IBOutlet weak var btnPlay: UIButton!
    
    var player: AVAudioPlayer!
    var timer: Timer?
    var timeDuration = 0
    var currentTime = 0
    var isLoop = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let path = Bundle.main.path(forResource: "If_I_Had_a_Chicken", ofType: "mp3") else {
            return
        }
        print("path bundle: \(path)")
        guard let url = URL(string: path) else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error {
            print(error.localizedDescription)
        }
        
        // https://stackoverflow.com/questions/9390298/iphone-how-to-detect-the-end-of-slider-drag
        sliderDuration.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        
        lblEndTime.text = convertTimeIntervalToString(time: player.duration)
        timeDuration = Int(round(player.duration))
        
        
        
    }
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .moved:
                currentTime = Int(slider.value * Float(player.duration))
                lblStartTime.text = convertTimeIntervalToString(time: player.currentTime)
                player.currentTime = TimeInterval(currentTime)
            case .ended:
                player.play()
            default:
                break            }
        }
    }
    
    @IBAction func btnLoop_Click(_ sender: UIButton) {
        isLoop = !isLoop
        if isLoop {
            player.stop()
            player.numberOfLoops = -1
            player.play()
            sender.alpha = CGFloat(1.0)
        } else {
            player.stop()
            player.numberOfLoops = 0
            player.play()
            sender.alpha = CGFloat(0.3)
        }
    }
    
//    @IBAction func slider_ValueChange(_ sender: UISlider) {
//        currentTime = Int(sender.value * Float(player.duration))
////        player.stop()
//        player.currentTime = TimeInterval(currentTime)
//        player.play()
//    }
    
    @IBAction func play(_ sender: UIButton) {
        // tag = 1 -> play ; tag = 2 -> pause
        if sender.tag == 1 {
            if let image = UIImage(named: "pause-icon.png") {
                sender.setImage(image, for: .normal)
                sender.tag = 2
                player.play()
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
            }
        } else {
            if let image = UIImage(named: "play-icon.png") {
                sender.setImage(image, for: .normal)
                sender.tag = 1
                timer?.invalidate()
                player.pause()
            }
        }
    }
    
    @objc func onTimerFires() {
        
        currentTime = Int(round(player.currentTime))
        print(currentTime)
        lblStartTime.text = convertTimeIntervalToString(time: player.currentTime)
        let a: Float = Float(player.currentTime / player.duration)
        sliderDuration.setValue(a, animated: true)
        print(a)
        if currentTime == self.timeDuration && player.numberOfLoops == 0 {
            self.timer?.invalidate()
            self.timer = nil
            if let image = UIImage(named: "play-icon.png") {
                btnPlay.setImage(image, for: .normal)
                btnPlay.tag = 1
                player.stop()
                player.currentTime = 0
            }
        }
    }
    
    func updateTimeLabel() {
        //let a = player.duration
    }
    
    func convertTimeIntervalToString(time: TimeInterval) -> String {
        let minutes = floor(time / 60)
        let seconds = round(time - minutes * 60)
        return "\(Int(minutes)):\(Int(seconds))"
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
