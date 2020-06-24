//
//  UILabelClass.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/23/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

class UILabelClassTitle: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLabel(){
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

class UILabelClassSubTitle: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLabel(){
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 12)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

class UILabelClassCopyright: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLabel(){
        self.textColor = UIColor.white
        self.font = UIFont.systemFont(ofSize: 10)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

