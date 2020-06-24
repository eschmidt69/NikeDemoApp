//
//  DetailView.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/23/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

protocol OpenITunes {
    func openITunes()
}

class DetailView: UIView {
    
    // This is the view for the Album Cover and details about Album. Also allows you to open iTunes.
    var tapDelegate: OpenITunes?
    
    let imageView = AlbumImageView(frame: CGRect.zero)
    let labelStack = StackView()
    let copyrightInfo = UILabelClassCopyright()
    let albumName = UILabelClassTitle()
    let artistName = UILabelClassSubTitle()
    let genre = UILabelClassSubTitle()
    let releaseDate = UILabelClassSubTitle()
    let loadButton = OpenAlbumButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        
        // Setting up the view also the constraints are set here. I have a utility that handles this as well for some
        // objects but showing how I can handle it in code etc.
        
        let safeArea = self.safeAreaLayoutGuide
        self.backgroundColor = UIColor.black
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the imageView
        self.addSubview(imageView)
        imageView.alpha = 0.0
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0)
        ])
        
        // Add the copyright text
        self.addSubview(copyrightInfo)
        copyrightInfo.numberOfLines = 0
        NSLayoutConstraint.activate([
            copyrightInfo.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            copyrightInfo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            copyrightInfo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
        ])
        
        // Add the detail label stack
        self.addSubview(labelStack)
        labelStack.alignment = .leading
        labelStack.distribution = .equalSpacing
        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: copyrightInfo.bottomAnchor, constant: 10),
            labelStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            labelStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])

        // Little Style for the text and background.
        
        albumName.textColor = UIColor.white
        artistName.textColor = UIColor.white
        genre.textColor = UIColor.white
        genre.numberOfLines = 0
        genre.lineBreakMode = .byWordWrapping
        releaseDate.textColor = UIColor.white
        
        labelStack.addArrangedSubview(albumName)
        labelStack.addArrangedSubview(artistName)
        labelStack.addArrangedSubview(releaseDate)
        labelStack.addArrangedSubview(genre)
        
        // Adding the bottom button to open iTunes
        self.addSubview(loadButton)
        loadButton.addTarget(self, action:#selector(self.openiTunes), for: .touchUpInside)
        NSLayoutConstraint.activate([
            loadButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            loadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            loadButton.heightAnchor.constraint(equalToConstant: 50),
            loadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func openiTunes(){
        // This calls the Protocol Delegate back to the VC to open the Album with the data. 
        tapDelegate?.openITunes()
    }
}

