//
//  TrackItem_Cell.swift
//  DemoJSON
//
//  Created by iMac_VTCA on 12/23/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

protocol DownloadTrackDelegate {
    func downloadTapped(_ cell: TrackItem_Cell)
    func cancelTapped(_ cell: TrackItem_Cell)
}

class TrackItem_Cell: UITableViewCell {

    
    @IBOutlet weak var lblTrackName: UILabel!
    @IBOutlet weak var lblTrackArtist: UILabel!
    @IBOutlet weak var btnDownloadTrack: UIButton!
    
    var downloadDelegate: DownloadTrackDelegate?
    
    @IBAction func btnDownload_Click(_ sender: UIButton) {
        downloadDelegate?.downloadTapped(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func visualize(data: Track) {
        lblTrackName.text = data.trackName
        lblTrackArtist.text = data.artistName
    }
    
}
