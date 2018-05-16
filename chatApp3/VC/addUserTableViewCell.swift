//
//  addUserTableViewCell.swift
//  chatApp3
//
//  Created by Apple on 3/2/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class addUserTableViewCell: UITableViewCell {
    @IBOutlet weak var myImage: circleImage!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var check: UIImageView!
    
    var show = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        check.isHidden = true
        
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


       
        
        
        
    }

}
