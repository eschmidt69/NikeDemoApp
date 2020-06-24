//
//  MusicTableDataSource.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

// DataSource for the TableView data from the Model

class MusicTableDataSource: NSObject, UITableViewDataSource {
    var albumData: [Results] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellID", for: indexPath) as? MusicTableCellTableViewCell,
            let albumName = albumData[indexPath.row].name,
            let artistName = albumData[indexPath.row].artistName,
            let imageLink = albumData[indexPath.row].artworkUrl100
            else {
                let cell = MusicTableCellTableViewCell(style: .default, reuseIdentifier: "customCellID")
                return cell }
        cell.albumName.text = "Album: \(albumName)"
        cell.artistName.text = "Artist: \(artistName)"
        cell.albumArt.image = UIImage(named: "Blank.png")
        cell.albumArt.downloadImage(link: imageLink, contentMode: UIView.ContentMode.scaleAspectFill)
        cell.backgroundColor = UIColor.white
        return cell
    }
}
