//
//  DataServices.swift
//  TestPaytmInsider
//
//  Created by HarshaVardhan Reddy on 17/09/20.
//  Copyright © 2020 HarshaReddy. All rights reserved.
//

import Foundation

// url for itunes album
let ALBUM_URL = "https://itunes.apple.com/search?term="

class DataService {
    
    static let instance = DataService()
    
    func getAlbums (searchRequest: String, complition: @escaping ([MyAlbum])->()) {
        var albums = [MyAlbum]()
        let searchString = searchRequest.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "\(ALBUM_URL)\(searchString)")
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    if let albumsResults = json["results"] as? NSArray {
                        
                        for album in albumsResults {
                            if let albumInfo = album as? [String: AnyObject] {
                                guard let artistName = albumInfo["artistName"] as? String else {continue}
                                guard let artworkUrl100 = albumInfo["artworkUrl100"] as? String else {continue}
                                guard let trackName = albumInfo["trackName"] as? String else {continue}
                                guard let collectionName = albumInfo["collectionName"] as? String else {continue}
                                guard let trackCensoredName = albumInfo["trackCensoredName"] as? String else {continue}
                                guard let collectionPrice = albumInfo["collectionPrice"] as? Double else {continue}
                                guard let trackPrice = albumInfo["trackPrice"] as? Double else {continue}
                                guard let releaseDate = albumInfo["releaseDate"] as? String else {continue}
                                let releaseDateFormatted = releaseDate.prefix(4)
                                guard let country = albumInfo["country"] as? String else {continue}
                                guard let currency = albumInfo["currency"] as? String else {continue}
                                guard let primaryGenreName = albumInfo["primaryGenreName"] as? String else {continue}
                                
                                let albumInstance = MyAlbum(artworkUrl100: artworkUrl100,artistName: artistName,trackName:trackName ,collectionName: collectionName, trackCensoredName:trackCensoredName, collectionPrice:collectionPrice,trackPrice:trackPrice,releaseDate: String(releaseDateFormatted),country: country,currency:currency, primaryGenreName: primaryGenreName )
                                
                                albums.append(albumInstance)
                            }
                        }
                        
                        print(albums.count)
                        complition(albums)
                        
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            if error != nil {
                print(error!.localizedDescription)
            }
        }.resume()
    }
    
    
}












