//
//  showImageViewController.swift
//  chatApp3
//
//  Created by Apple on 3/15/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class showImageViewController: UIViewController {
    
    @IBAction func dis(_ sender: Any) {
        dismiss(animated: true, completion: nil )
    }
    var image : String?
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if image == "768646" {
            
            myImage.image = UIImage(named: "768646")
            
        } else {
            
            myImage.sd_setImage(with: URL(string: image!))
            
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
