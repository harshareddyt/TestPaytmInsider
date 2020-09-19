//
//  AlbumCollectionViewCell.swift
//  TestPaytmInsider
//
//  Created by HarshaVardhan Reddy on 17/09/20.
//  Copyright © 2020 HarshaReddy. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumArtistLabel: UILabel!
    
    func updateCell (album: MyAlbum) {
        let imageUrl = URL(string: album.artworkUrl100)
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl!) {
                DispatchQueue.main.async {
                    self.albumImage.image = UIImage(data: imageData)
                }
            }
        }
        albumTitleLabel.text = album.collectionName
        albumArtistLabel.text = album.artistName
    }
}
