//
//  myTextTableViewCell.swift
//  chatApp3
//
//  Created by Apple on 2/19/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class myTextTableViewCell: UITableViewCell {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textingLabel: UILabel!
    @IBOutlet weak var myImage: circleImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
