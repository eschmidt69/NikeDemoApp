//
//  NikeDemoTests.swift
//  NikeDemoTests
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import XCTest
@testable import NikeDemo

class NikeDemoTests: XCTestCase {
    // Normally never force unwrap, but in TestCases you should on properties to limit boilerplate code.
    var musicVC: MusicMenu!
    
    override func setUp() {
        super.setUp()
        musicVC = MusicMenu()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_ModelData (){
        // Given
        let promise = expectation(description: "Status code: 200")
        
        // When
        XCTAssertEqual(musicVC.musicTableViewDataSource.albumData.count, 0, "Empty Results")
        
        let semaphore = DispatchSemaphore (value: 0)
        if let urlRequestString = URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/25/explicit.json") {
            var request = URLRequest(url: urlRequestString,timeoutInterval: NetworkSettings().networkTimeout)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                semaphore.signal()
                guard
                    let data = data
                else { return }
                AppUtility().loadAlbumData(data) { albumArray, errorMessage in
                    if let feedResults = albumArray?.feed?.results {
                        self.musicVC.musicTableViewDataSource.albumData = feedResults
                        // Then
                        XCTAssertEqual(self.musicVC.musicTableViewDataSource.albumData.count, 25, "Didn't parse 25 items from fake response")
                    }
                }
            }
            task.resume()
            promise.fulfill()
            wait(for: [promise], timeout: 5)
            semaphore.wait()
        }
       
    }
    
    
    func test_StartDownload_Performance() {
        measure {
            NetworkLayer().callMusicRSSFeed() { data, response, error in }
            NetworkLayer().downLoadImageData("https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/2c/b6/84/2cb684e2-70b8-06d0-691f-c968363d821d/886448465690.jpg/200x200bb.png") { data, response, error in }
        }
    }
}

