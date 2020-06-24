//
//  TopAlbumsModel.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/23/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import Foundation

// Apple Model Data
// There is more that can be added but this was all I needed to meet the app requirements.

struct AlbumFeed : Codable {
    var feed: FeedData?
}
struct FeedData : Codable { // This is here to allow for extending data if needed.
    var copyright : String?
    var results: [Results]?
}
struct Results: Codable {
    var artistName: String?
    var name: String?
    var artworkUrl100: String? // This is the URL to the image.
    var copyright: String?
    var releaseDate: String?
    var url: String?
    var genres : [Genres]?
}

struct Genres: Codable {
    var genreId : String?
    var name : String?
    var url : String?
}
