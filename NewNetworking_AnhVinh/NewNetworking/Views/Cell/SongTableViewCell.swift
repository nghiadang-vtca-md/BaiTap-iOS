//
//  SongTableViewCell.swift
//  NewNetworking
//
//  Created by THAI LE QUANG on 12/23/19.
//  Copyright © 2019 THAI LE QUANG. All rights reserved.
//

import UIKit
import AVFoundation

protocol SongTableViewCellDelegate: class {
    func downloadTapped(_ cell: SongTableViewCell)
    func cancelTapped(_ cell: SongTableViewCell)
    func pauseTapped(_ cell: SongTableViewCell)
    func resumeTapped(_ cell: SongTableViewCell)
}

class SongTableViewCell: UITableViewCell, Cell {
    //
    //MARK: - Outlet
    //
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var downloadProgress: UIProgressView!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //
    //MARK: - Variable, Constants
    //
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    var audioPlayer: AVAudioPlayer!
    
    //Delegate
    weak var delegate: SongTableViewCellDelegate?
    
    //
    //MARK: - Handle Actions
    //
    @IBAction func downloadButton_clicked(_ sender: Any) {
        delegate?.downloadTapped(self)
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        
        if(pauseButton.titleLabel?.text == "Pause") {
            delegate?.pauseTapped(self)
        } else {
            delegate?.resumeTapped(self)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        delegate?.cancelTapped(self)
        
        downloadButton.isHidden = false
        cancelButton.isHidden = true
        pauseButton.isHidden = true
        
        pauseButton.setTitle("Pause", for: .normal)
        
        downloadProgress.progress = 0
        percentLabel.text = "0% of 0.0 MB"
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        
        let playButton = sender as! UIButton
        
        if !audioPlayer.isPlaying {
            playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            audioPlayer.play()
            
        } else {
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            audioPlayer.pause()
        }
    }
    
    //
    //MARK: - Display cell
    //
    //    func visualizeCell(with track: Track, download: Download?) {
    //
    //        songNameLabel.text = track.name
    //        artistLabel.text = track.artist
    //
    //        if download?.track.isDownloaded ?? false {
    //            downloadButton.isHidden = true
    //            pauseButton.isHidden = true
    //            cancelButton.isHidden = true
    //            percentLabel.isHidden = true
    //            downloadProgress.isHidden = true
    //            playButton.isHidden = false
    //
    //            createAudioPlayer(with: track)
    //
    //        } else {
    //            downloadButton.isHidden = false
    //            pauseButton.isHidden = true
    //            cancelButton.isHidden = true
    //            percentLabel.isHidden = false
    //            downloadProgress.isHidden = false
    //
    //            downloadProgress.progress = 0
    //
    //            percentLabel.text = "0% of 0.0 MB"
    //        }
    //    }
    
    func configure(track: Track, downloaded: Bool, download: Download?) {
        songNameLabel.text = track.name
        artistLabel.text = track.artist
        
        // Show/hide download controls Pause/Resume, Cancel buttons, progress info.
        var showDownloadControls = false
        
        // Non-nil Download object means a download is in progress.
        if let download = download {
            showDownloadControls = true
            
            let title = download.isDownloading ? "Pause" : "Resume"
            pauseButton.setTitle(title, for: .normal)
        }
        
        pauseButton.isHidden = !showDownloadControls
        cancelButton.isHidden = !showDownloadControls
        
        downloadProgress.isHidden = !showDownloadControls
        downloadProgress.isHidden = !showDownloadControls
        
        // If the track is already downloaded, enable cell selection and hide the Download button, pause button, resume button.
        selectionStyle = downloaded ? UITableViewCell.SelectionStyle.gray : UITableViewCell.SelectionStyle.none
        downloadButton.isHidden = downloaded || showDownloadControls
        pauseButton.isHidden = !downloaded
        cancelButton.isHidden = !downloaded
        
//        if downloaded == true {
//            downloadButton.isHidden = true
//            pauseButton.isHidden = true
//            cancelButton.isHidden = true
//            downloadProgress.isHidden = true
//        }
       
    }
    
    private func createAudioPlayer(with track: Track) {
        if audioPlayer == nil {
            let lastPathComponent = track.previewURL.lastPathComponent
            let audioURL = documentsPath.appendingPathComponent(lastPathComponent)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer.delegate = self
            } catch {
                print("Init audioPlayer failed: \(error)")
            }
        }
    }
    
    //    func updateDisplay(progress: Float, totalSize : String, download: Download) {
    //
    //        downloadProgress.progress = progress
    //        percentLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
    //
    //        if download.isDownloading {
    //            downloadButton.isHidden = true
    //            pauseButton.isHidden = false
    //            cancelButton.isHidden = false
    //
    //        } else {
    //            downloadButton.isHidden = true
    //            pauseButton.isHidden = false
    //            cancelButton.isHidden = false
    //        }
    //    }
    
    func updateDisplay(progress: Float, totalSize : String) {
        downloadProgress.progress = progress
        percentLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
    }
}

extension SongTableViewCell: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        if flag {
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        }
    }
}
