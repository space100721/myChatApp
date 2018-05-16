//
//  TableViewCellgroupz.swift
//  chatApp3
//
//  Created by Apple on 4/25/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class TableViewCellgroupz: UITableViewCell {
  
   
    
    @IBOutlet weak var vieww: circleCorn!
    @IBOutlet weak var myImage: circleImage!
    @IBOutlet weak var memNumbers: UILabel!
    @IBOutlet weak var groupName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

     
        vieww.layer.borderColor = UIColor.white.cgColor
        vieww.layer.borderWidth = 3
        vieww.backgroundColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0)
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
