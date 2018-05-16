//
//  showImagesViewController.swift
//  chatApp3
//
//  Created by Apple on 4/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

import SDWebImage

class showImagesViewController: UIViewController {
    
    var user : String?

    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if user == "768646" {
            
            myImage.image = UIImage(named: "768646")
            
        } else {
            
            myImage.sd_setImage(with: URL(string: user!))
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
