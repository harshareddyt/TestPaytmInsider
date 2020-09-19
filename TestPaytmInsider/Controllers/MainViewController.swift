//
//  MainViewController.swift
//  TestPaytmInsider
//
//  Created by HarshaVardhan Reddy on 16/09/20.
//  Copyright © 2020 HarshaReddy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var activityIndicatorView: UIActivityIndicatorView!
    var albums = [MyAlbum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isHidden = true
        
        ///Activity Indicator
        let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        collectionView.backgroundView = activityIndicatorView
        self.activityIndicatorView = activityIndicatorView
        
        searchBar.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .automatic
        }
        let indentation = (self.view.bounds.size.width - 300) / 4
        collectionView.contentInset = UIEdgeInsets(top: indentation, left: indentation, bottom: indentation, right: indentation)
        
        addShadowToNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlbumDetailVC" {
            if let destinationVC = segue.destination as? AlbumDetailViewController {
                if let album = sender as? MyAlbum {
                    destinationVC.album = album
                }
            }
        }
    }
    
    func addShadowToNavigationBar() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
}

// MARK: - CollectionView methods

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AlbumCollectionViewCell {
            cell.updateCell(album: albums[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        performSegue(withIdentifier: "AlbumDetailVC", sender: album)
        searchBar.resignFirstResponder()
    }
    
}

// MARK: - SearchBar methods

extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       if searchBar.text != nil || searchBar.text != "" {
            self.activityIndicatorView.startAnimating()
            collectionView.isHidden = false
            DataService.instance.getAlbums(searchRequest: searchBar.text!) { (requestedAlbums) in
                self.albums = requestedAlbums.sorted(by: {$0.collectionName < $1.collectionName})
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.activityIndicatorView.stopAnimating()
                }
            }
        }
        searchBar.resignFirstResponder()
    }
}








