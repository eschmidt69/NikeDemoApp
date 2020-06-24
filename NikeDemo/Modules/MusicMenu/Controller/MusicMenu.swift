//
//  MusicMenu.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

class MusicMenu: UIViewController {
    
    let musicTableView = MusicTableView()
    
    // Setup the delgate and datasource
    let musicTableViewDelegate = MusicTableDelegate()
    let musicTableViewDataSource = MusicTableDataSource()
    
    // Section App Overides
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Controller Config
        self.view.backgroundColor = UIColor.white
        
        // Setup the Navigation Controller Title
        self.title = "Nike Demo - Top 25 Albums"
        
        // Call the data and prep it for the tableView.
        NetworkLayer().callMusicRSSFeed() { data, response, error in
            guard let data = data else {
                return
            }
            // Load the returned data in the model - If model is bad errorMessage will explain what is bad in the data.
            AppUtility().loadAlbumData(data) { albumArray, errorMessage in
                if errorMessage == nil {
                    // Setup the View for this controller. It has a NavController as well. Set in Scene.
                    // Return to Main Thread from Service Call
                    DispatchQueue.main.async {
                        if let _albumArray = albumArray {
                            self.loadDataViewTable(_albumArray)
                        }
                    }
                }else{
                    // A Action to explain if the data is bad. Missing Types or Data Corruption etc
                    let refreshAlert = UIAlertController(title: "Data Error!", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction) in }))
                    DispatchQueue.main.async {
                        self.present(refreshAlert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    // END Overide Section
    private func loadDataViewTable(_ dataSource: AlbumFeed){
        
        // Register the cell for the tableView
        musicTableView.register(MusicTableCellTableViewCell.self, forCellReuseIdentifier: "customCellID")
        
        // Set the delegate and datarouce for the table to load.
        musicTableView.delegate = musicTableViewDelegate
        musicTableView.dataSource = musicTableViewDataSource
        musicTableViewDelegate.tapDelegate = self
        
        // Get the dataArray from the feed.
        guard
            let dataArray = dataSource.feed?.results
        else { return }
        musicTableViewDataSource.albumData = dataArray
        musicTableView.backgroundColor = UIColor.black
        view.addSubview(musicTableView)
        
        // Since we are not using Storyboard or Nibs, we need to setup constraints manually.
        // I built this Utility to show how I normally deal with constraints, but process constraints also in code
        AppUtility().processVCConstraint(self, musicTableView, top: 2.0, bottom: 0.0, right: 0.0, left: 0.0)
    }
}

extension MusicMenu: AlbumSelection {
    func openDetails(_ id: Int) {
        // Init the detailVC
        let detailViewController = DetailViewController()
        
        // Pass the data to the viewController.
        detailViewController.albumData = musicTableViewDataSource.albumData[id]
        // Push the detail view onto the Nav Stack
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

