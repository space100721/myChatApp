//
//  unBlockTableViewCell.swift
//  chatApp3
//
//  Created by Apple on 3/5/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class unBlockTableViewCell: UITableViewCell {


    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var check: UIImageView!
    
    var meme = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            
            if meme {
                
            
                check.isHidden = true
                
                meme = false
                
                
                
            } else {
                
                check.isHidden = false
                
                meme = true
                
                
            }
            
            
            
            
            
        }
        
        
        
    }

}
