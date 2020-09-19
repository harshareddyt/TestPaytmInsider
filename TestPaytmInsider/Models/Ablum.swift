//
//  Album.swift
//  TestPaytmInsider
//
//  Created by HarshaVardhan Reddy on 17/09/20.
//  Copyright © 2020 HarshaReddy. All rights reserved.
//

import UIKit

class MyAlbum {
    
    let artworkUrl100: String
    let artistName: String
    var trackName: String
    let collectionName: String
    let trackCensoredName: String
    let collectionPrice: Double
    let trackPrice: Double
    var releaseDate: String
    let country: String
    let currency: String
    let primaryGenreName: String
    
    init(artworkUrl100: String,artistName: String,trackName: String, collectionName:String,trackCensoredName:String,collectionPrice: Double,trackPrice:Double,releaseDate: String,country: String,currency:String,primaryGenreName: String)
    {
        self.artworkUrl100 = artworkUrl100
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
        self.trackCensoredName = trackCensoredName
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.releaseDate = releaseDate
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
    }
}
