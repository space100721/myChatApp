//
//  creatGroupTableViewCell.swift
//  chatApp3
//
//  Created by Apple on 2/19/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class creatGroupTableViewCell: UITableViewCell {
  

    @IBOutlet weak var myImage: circleImage!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var vieww: UIView!
    


    
    var show = false
    
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
        
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

 
        
        
        // Initialization code
    }

  

}
