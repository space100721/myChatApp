//
//  viewwza.swift
//  chatApp3
//
//  Created by Apple on 4/30/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

class circleCorn : UIView {
    
    override func awakeFromNib() {
        showMee()
    }
    
    func showMee() {
        
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
        
        
    }
    
}
