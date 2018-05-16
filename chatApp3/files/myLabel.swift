//
//  myLabel.swift
//  chatApp3
//
//  Created by Apple on 3/19/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class myLabel: UILabel {

    override func awakeFromNib() {
        cornerMe()
    }
    
    func cornerMe () {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
        
        
    }
    
    
}
