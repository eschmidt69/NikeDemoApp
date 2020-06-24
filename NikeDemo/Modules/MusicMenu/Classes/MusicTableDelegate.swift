//
//  MusicTableDelegate.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

// Delegate for the TableView seletion of Album

protocol AlbumSelection {
    func openDetails(_ id: Int)
}

class MusicTableDelegate: NSObject, UITableViewDelegate {
    var tapDelegate: AlbumSelection?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableSettings().rowHeight
    }
    // MARK: Profile Tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tapDelegate?.openDetails(indexPath.row)
    }
}
