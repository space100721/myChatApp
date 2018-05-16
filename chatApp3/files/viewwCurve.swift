//
//  viewwCurve.swift
//  chatApp3
//
//  Created by Apple on 4/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class viewwCurve: UIView {

    override func awakeFromNib() {
        curveMe()
    }
    
    
    func curveMe() {
        layer.cornerRadius = 8
        clipsToBounds = true
    }

}
