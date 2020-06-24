//
//  UIImageView+downloadImage.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/23/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

extension UIImageView {
    // Lazy loader for smaller images in the TableView. I use another loader for the detail view that gets better resolution.
    func downloadImage(link:String, contentMode: UIView.ContentMode) {
        guard
            let linkValue = NSURL(string:link)
        else { return }
        URLSession.shared.dataTask( with: linkValue as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
