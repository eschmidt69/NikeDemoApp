//
//  MusicTableCellTableViewCell.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

// CellView for Model Data. 

class MusicTableCellTableViewCell: UITableViewCell {
    
    let cellView = CellView()
    let labelStack = StackView()
    let albumName = UILabelClassTitle()
    let artistName = UILabelClassSubTitle()
    let albumArt = AlbumImageView(frame: CGRect.zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCellView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCellView(){
        addSubview(cellView)
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0)
        ])
        // Add the UIImageView
        cellView.addSubview(albumArt)
        NSLayoutConstraint.activate([
            albumArt.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: TableSettings().cellPadding),
            albumArt.topAnchor.constraint(equalTo: cellView.topAnchor, constant: TableSettings().cellPadding),
            albumArt.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -TableSettings().cellPadding),
            albumArt.widthAnchor.constraint(equalToConstant: TableSettings().rowHeight - TableSettings().cellPadding)
        ])
        labelStack.addArrangedSubview(albumName)
        labelStack.addArrangedSubview(artistName)
        addSubview(labelStack)
        NSLayoutConstraint.activate([
            labelStack.leadingAnchor.constraint(equalTo: albumArt.trailingAnchor, constant: TableSettings().cellPadding*2),
            labelStack.topAnchor.constraint(equalTo: cellView.topAnchor, constant: TableSettings().cellPadding),
        ])
    }
}
