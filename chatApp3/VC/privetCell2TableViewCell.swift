//
//  privetCell2TableViewCell.swift
//  chatApp3
//
//  Created by Apple on 3/14/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class privetCell2TableViewCell: UITableViewCell {
    @IBOutlet weak var changeMe: NSLayoutConstraint!
    @IBOutlet weak var textingLabel: UILabel!
    @IBOutlet weak var vieww: circleVieww!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
