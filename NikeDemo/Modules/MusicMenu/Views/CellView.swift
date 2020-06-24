//
//  CellView.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/23/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

class CellView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
