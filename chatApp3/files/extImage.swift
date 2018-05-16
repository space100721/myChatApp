//
//  extImage.swift
//  chatApp3
//
//  Created by Apple on 5/15/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    var highestQualityJPEGNSData: NSData { return UIImageJPEGRepresentation(self, 0.25)! as NSData }
    var highQualityJPEGNSData: NSData    { return UIImageJPEGRepresentation(self, 0.25)! as NSData}
    var mediumQualityJPEGNSData: NSData  { return UIImageJPEGRepresentation(self, 0.25)! as NSData }
    var lowQualityJPEGNSData: NSData     { return UIImageJPEGRepresentation(self, 0.25)! as NSData}
    var lowestQualityJPEGNSData: NSData  { return UIImageJPEGRepresentation(self, 0.0)! as NSData }
}

