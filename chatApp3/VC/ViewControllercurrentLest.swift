//
//  ViewControllercurrentLest.swift
//  chatApp3
//
//  Created by Apple on 4/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ViewControllercurrentLest: UIViewController {
    
    var keys : String?
    
    
    var users22 : [String]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendMe(_ sender: Any) {
        performSegue(withIdentifier: "finally", sender: keys)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var firstVC = segue.destination as! addNewViewController
        firstVC.keys = sender as? String
        firstVC.users22 = users22 as! [String]
        
    }
    
    

}
