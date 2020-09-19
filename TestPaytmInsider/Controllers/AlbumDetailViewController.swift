//
//  AlbumDetailViewController.swift
//  TestPaytmInsider
//
//  Created by HarshaVardhan Reddy on 16/09/20.
//  Copyright © 2020 HarshaReddy. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    @IBOutlet weak var albumImage: UIImageView!
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var trackCensoredNameLabel: UILabel!
    @IBOutlet weak var collectionPriceLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var primaryGenreNameLabel: UILabel!
    
    var album : MyAlbum!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    // Update UI content in current controller
    func updateLabels() {
        artistLabel.text = album.artistName
        trackNameLabel.text = album.trackName
        collectionNameLabel.text = album.collectionName
        trackCensoredNameLabel.text = album.trackCensoredName
        collectionPriceLabel.text = "\(String(format: "%.1f", album.collectionPrice))"
        trackPriceLabel.text = "\(String(format: "%.1f", album.trackPrice))"
        releaseDateLabel.text = album.releaseDate
        countryLabel.text = album.country
        currencyLabel.text = album.currency
        primaryGenreNameLabel.text = album.primaryGenreName
        
        let imageUrl = URL(string: album.artworkUrl100)!
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.albumImage.image = UIImage(data: imageData)
                }
            }
        }
    }
}



