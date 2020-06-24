//
//  NetworkLayer.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import Foundation

public class NetworkLayer: NSObject {

    open func callMusicRSSFeed(completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let semaphore = DispatchSemaphore (value: 0)
        if let urlRequestString = URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/25/explicit.json") {
            var request = URLRequest(url: urlRequestString,timeoutInterval: NetworkSettings().networkTimeout)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                semaphore.signal()
                completion(data, response, error)
            }
            task.resume()
            semaphore.wait()
        }
    }
    
    open func downLoadImageData(_ imageURL: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let semaphore = DispatchSemaphore (value: 0)
        if let urlRequestString = URL(string: imageURL) {
            var request = URLRequest(url: urlRequestString,timeoutInterval: NetworkSettings().networkTimeout)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                semaphore.signal()
                completion(data, response, error)
            }
            task.resume()
            semaphore.wait()
        }
    }
}


