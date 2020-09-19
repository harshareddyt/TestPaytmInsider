//
//  DetailTableViewCell.swift
//  TestPaytmInsider
//
//  Created by Sarveshwar Reddy on 17/09/20.
//  Copyright © 2020 HarshaReddy. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var trackNumber: UILabel!
    
    @IBOutlet weak var trackName: UILabel!
    
    func updateCell (track: MyTrackAlbum) {
           trackNumber.text = String(track.trackNumber)
           trackName.text = track.trackName
    }
    

}
