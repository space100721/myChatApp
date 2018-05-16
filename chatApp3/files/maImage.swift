//
//  maImage.swift
//  chatApp3
//
//  Created by Apple on 4/3/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class maImage: UIImageView {

    
    override func awakeFromNib() {
        showMe()
    }
    
    
    func showMe () {
        layer.cornerRadius = 6
        clipsToBounds = true
    }

}
