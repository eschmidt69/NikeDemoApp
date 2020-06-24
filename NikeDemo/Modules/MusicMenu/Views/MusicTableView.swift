//
//  MusicTableView.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

class MusicTableView: UITableView {
    
    //TableView Object for the Album data.
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setupTableView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupTableView(){
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
