//
//  circleImage.swift
//  chatApp3
//
//  Created by Apple on 2/19/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class circleImage: UIImageView {

    override func awakeFromNib() {
        circleImage()
    }
    
    
    func circleImage () {
        layer.cornerRadius = frame.height / 2

     
        clipsToBounds = true
        
    }
    
    
}
