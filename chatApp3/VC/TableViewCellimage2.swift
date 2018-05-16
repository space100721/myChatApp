//
//  TableViewCellimage2.swift
//  chatApp3
//
//  Created by Apple on 4/2/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class TableViewCellimage2: UITableViewCell {

    
    @IBOutlet weak var myImages: maImage!
    @IBOutlet weak var maImage: circleImage!

    @IBOutlet weak var stamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization cod
        maImage.layer.borderWidth = 1
        maImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        myImages.layer.cornerRadius = 8
     
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
