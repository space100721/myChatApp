//
//  button.swift
//  chatApp3
//
//  Created by Apple on 2/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class button: UIButton {
    
    var origin : CGRect?


    override func awakeFromNib() {
        circleShadow()
    }
    
    func circleShadow () {
 
        
        origin = layer.frame
        layer.shadowColor = UIColor.brown.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.75
        
        layer.cornerRadius = 5
        
    }
    
   
    func changeSize(load : Bool , title : String ) {
        
        
        
        var spinner = UIActivityIndicatorView()
        spinner.color = UIColor.darkGray
        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.alpha = 0.0
        spinner.tag = 21
        
        if load {
            
            
              self.isUserInteractionEnabled = false
            
            
            
            self.addSubview(spinner)
            self.setTitle("LOG IN / SIGN UP", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.layer.backgroundColor = UIColor.gray.cgColor
                self.layer.cornerRadius = self.frame.height / 2
                self.layer.frame = CGRect(x: self.frame.midX - (self.frame.height / 2) , y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
                
                spinner.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.height / 2 + 1)
                
            }, completion: { (complete) in
                if complete == true {
                    self.isUserInteractionEnabled = false
                    spinner.startAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        
                        spinner.alpha = 1.0
                    })
                    
                }
            })
            
        } else {
            
            
              self.setTitle("LOG IN / SIGN UP", for: .normal)
            for view in subviews {
                if view.tag == 21 {
                    view.removeFromSuperview()
                }
            }
                
                spinner.stopAnimating()
                
                self.layer.frame = self.origin!
                self.backgroundColor = UIColor.blue
                
                self.layer.cornerRadius = 5
                
                self.isUserInteractionEnabled = true
                
                
            }
                
                
            
            
        
            
            
        
                
                
                
    }
    
    

}
