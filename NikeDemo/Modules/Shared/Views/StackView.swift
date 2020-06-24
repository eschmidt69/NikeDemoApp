//
//  CellView.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/23/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

class StackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStackView()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView(){
        self.axis = NSLayoutConstraint.Axis.vertical
        self.distribution = UIStackView.Distribution.equalCentering
        self.alignment = UIStackView.Alignment.leading
        self.spacing = 5;
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
