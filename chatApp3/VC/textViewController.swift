//
//  textViewController.swift
//  chatApp3
//
//  Created by Apple on 2/18/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

class textViewController: UIViewController  {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textBox: UITextView!
    

    
    
    var image : String!
    
    
    
    
    @IBAction func sendButton(_ sender: Any) {
        
        if textBox.text != "" {
        
            var text = ["email" : Auth.auth().currentUser!.email , "text" : textBox.text , "image" : image]
        
        DataService.instance.text.childByAutoId().updateChildValues(text)
        
        var story = storyboard?.instantiateViewController(withIdentifier: "firstVC")
            present(story!, animated: true, completion: nil)
    
        }
    }
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       sendButton.observing()
     

        // Do any additional setup after loading the view.
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        emailLabel.text = Auth.auth().currentUser!.email
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
         
            guard let snapChatt = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for snap in snapChatt {
                if snap.key == Auth.auth().currentUser!.uid {
                    
                    if snap.hasChild("image") {
                        
                        self.image = snap.childSnapshot(forPath: "image").value as! String
                        
                        print("ff")
                    }
                    
                    
                    
                    
                }
            }
        })
        
        
        
    }

}
