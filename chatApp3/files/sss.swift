//
//  sss.swift
//  chatApp3
//
//  Created by Apple on 5/7/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit


class NewLabel: UILabel {
    
    
    
    override func draw(_ rect: CGRect) {
        super.drawText(in: self.bounds.insetBy(dx: CGFloat(5.0), dy: CGFloat(5.0)))
    }
    
}
