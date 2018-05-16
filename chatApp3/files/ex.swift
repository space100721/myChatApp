//
//  ex.swift
//  chatApp3
//
//  Created by Apple on 2/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
   
    
    func showMe (show : Bool) {
        
         var viewShadow : UIView?
        
        if show {
            
            viewShadow = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height))
            viewShadow?.tag = 31
            viewShadow?.alpha = 0.7
            viewShadow?.backgroundColor = UIColor.black
            
           
           
            
            
            var spinner = UIActivityIndicatorView()
            spinner.activityIndicatorViewStyle = .whiteLarge
            spinner.color = UIColor.white
            spinner.center = view.center
            
            
            view.addSubview(viewShadow!)
            viewShadow?.addSubview(spinner)
            
            spinner.startAnimating()
            
            
            
            
        } else {
            
            for me in view.subviews {
                if me.tag == 31 {
                    me.removeFromSuperview()
                }
            }
            
            
            
        }
        
        
        
    }
}
