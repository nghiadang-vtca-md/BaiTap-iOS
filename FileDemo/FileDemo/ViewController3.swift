//
//  ViewController3.swift
//  FileDemo
//
//  Created by iMac_VTCA on 12/16/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController3: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // bundle là file có sẵn trong app
        guard let path = Bundle.main.path(forResource: "If_I_Had_a_Chicken", ofType: "mp3") else {
            return
        }
        // sự khác biệt giữa path document và bundle
        let documentPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        print("path document: \(documentPathString!)")
        print("path bundle: \(path)")
        
        // chuyển path String sang URL
        guard let url = URL(string: path) else {
            return
        }
        print(url)
        
        do {
            
            // show hide loading -> chưa làm được
            player = try AVAudioPlayer(contentsOf: url)
//            let duration = player.duration
//            print(duration)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        player.play()
    }
    
    @IBAction func pause(_ sender: UIButton) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        player.stop()
    }
    
    /*
    chọn TARGETS -> build phrasea Link.... -> dấu cộng -> search -> AVFoundation
    */

}
