//
//  UIButtonClass.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/24/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit


class OpenAlbumButton: UIButton { // This is the blue button
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.titleLabel?.font = UIFont(name: "System", size: 12)
        let attributtedTitle = NSAttributedString(string: "Open", attributes: [NSAttributedString.Key.kern: 1.0])
        self.setAttributedTitle(attributtedTitle, for: .normal)
        self.backgroundColor = UIColor.darkGray
        self.titleLabel?.textColor = UIColor.white
        self.layer.cornerRadius = 10.0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
