//
//  privet22TableViewCell.swift
//  chatApp3
//
//  Created by Apple on 3/15/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class privet22TableViewCell: UITableViewCell {

    @IBOutlet weak var vieww: circleVieww!
    @IBOutlet weak var textingLabel: UILabel!
    @IBOutlet weak var changeMe: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
