//
//  bigImageViewController.swift
//  chatApp3
//
//  Created by Apple on 3/15/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class bigImageViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    var users : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if users == "768646" {
            
            myImage.image = UIImage(named: "768646")
            
        } else {
            
            
            myImage.sd_setImage(with: URL(string: users! ))
        }
        
        
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func dis(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
