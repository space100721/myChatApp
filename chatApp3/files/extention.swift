//
//  extention.swift
//  chatApp3
//
//  Created by Apple on 2/18/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func observing () {
        NotificationCenter.default.addObserver(self, selector: #selector(change(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame  , object: nil)
    }
    
    @objc func change(_ noti : NSNotification) {
        
        let delay = noti.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        var show = (noti.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var end  = (noti.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        var opt = noti.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        
        var different = end.origin.y - show.origin.y

        
        UIView.animateKeyframes(withDuration: delay, delay: 0.0 , options: UIViewKeyframeAnimationOptions( rawValue : opt ), animations: {
            
            self.frame.origin.y += different  + 50
            
        }) { (finish) in
            
            
            
         
        }
        
        
    }
    
    
}
