//
//  circleView.swift
//  chatApp3
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class circleView: UIView {

  
    override func awakeFromNib() {
        
        CircleMe()
        
    }
    
    
    func CircleMe () {
        layer.cornerRadius = 3.0
        
    }
    
    
}
