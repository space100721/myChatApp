//
//  myGroupsTableViewCell.swift
//  chatApp3
//
//  Created by Apple on 2/20/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class myGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupType: UILabel!
    @IBOutlet weak var myImage: circleImage!
    @IBOutlet weak var notiLabel: myLabel!
    
    
    
    @IBOutlet weak var stamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            
            
            
        }

        // Configure the view for the selected state
    }

}
