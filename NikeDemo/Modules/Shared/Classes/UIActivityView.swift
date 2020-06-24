//
//  UIActivityView.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/24/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

// ActivityView Indicator

class UIActivityView: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupIndicatorView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupIndicatorView(){
        self.hidesWhenStopped = true
        self.style = UIActivityIndicatorView.Style.large
        self.color = UIColor.white
    }
}
