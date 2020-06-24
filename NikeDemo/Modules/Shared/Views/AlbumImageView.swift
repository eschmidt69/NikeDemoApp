//
//  ImageView.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/23/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

class AlbumImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupImageView()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupImageView(){
        self.backgroundColor = UIColor.black
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
