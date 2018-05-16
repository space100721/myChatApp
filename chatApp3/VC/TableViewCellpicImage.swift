//
//  TableViewCellpicImage.swift
//  chatApp3
//
//  Created by Apple on 4/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class TableViewCellpicImage: UITableViewCell {
  
    
    
    @IBOutlet weak var myImage: maImage!
    @IBOutlet weak var stamp: UILabel!
    
    @IBOutlet weak var vieww: viewwCurve!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        myImage.layer.cornerRadius = 8
        myImage.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }

}
