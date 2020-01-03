//
//  SongTableViewCell.swift
//  DemoDownloadFile_Practice
//
//  Created by user159518 on 12/25/19.
//  Copyright © 2019 user159518. All rights reserved.
//

import UIKit

protocol SongTableViewCellDelegate: class {
    func downloadTapped(_ cell: SongTableViewCell)
    func cancelTapped(_ cell: SongTableViewCell)
    func pauseTapped(_ cell: SongTableViewCell)
    func resumeTapped(_ cell: SongTableViewCell)
}

class SongTableViewCell: UITableViewCell, Cell {

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var downloadProgress: UIProgressView!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    weak var delegate: SongTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func downloadButton_clicked(_ sender: UIButton) {
        delegate?.downloadTapped(self)
    }
    
    @IBAction func pauseButton_clicked(_ sender: UIButton) {
    }
    
    @IBAction func cancelButton_clicked(_ sender: UIButton) {
    }
    
    func visualizeCell(with track: Track) {
        songNameLabel.text = track.trackName
        artistLabel.text = track.artistName
    }
    
    func updateDisplay(progress: Float, totalSize: String) {
        downloadProgress.progress = progress
        percentLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
    }
    
//    func hiddenItemDownload() {
//        updateDisplay(progress: 0.0, totalSize: "0")
//        downloadProgress.isHidden = true
//        percentLabel.isHidden = true
//    }
}
