//
//  textBox.swift
//  chatApp3
//
//  Created by Apple on 2/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class textBox: UITextField {
    
    override func awakeFromNib() {
        changeColor()
    }

    var input = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, input)
        
        
    
    }
    
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return UIEdgeInsetsInsetRect(bounds, input)
        
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
         return UIEdgeInsetsInsetRect(bounds, input)
    }
    
    
    func changeColor() {

    
        var placeholder =  NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        
        self.attributedPlaceholder = placeholder
        
    }

}
