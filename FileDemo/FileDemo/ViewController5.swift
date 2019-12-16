//
//  ViewController5.swift
//  FileDemo
//
//  Created by iMac_VTCA on 12/16/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController5: UIViewController {
    
    var avpVC: AVPlayerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareVideo()
    }
    
    func prepareVideo() {
        guard let path = Bundle.main.path(forResource: "SampleVideo_1280x720_1mb.mp4", ofType: nil) else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        avpVC = AVPlayerViewController()
        let player = AVPlayer(url: url)
        avpVC.player = player
    }
    
    // khi load xong tự động play ( không khả thi)
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//
//        self.present(avpVC, animated: true) {
//            self.avpVC.player?.play()
//        }
//    }
    
    @IBAction func play_video(_ sender: UIButton) {
        self.present(avpVC, animated: true) {
            self.avpVC.player?.play()
        }
    }
    /*
    Nhớ import AVKit framework
     
     
    */

}
