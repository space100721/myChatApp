//
//  secondChatViewController.swift
//  chatApp3
//
//  Created by Apple on 3/3/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

class secondChatViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var chatt : String?
    
    var user : String?
    
    var image : String?
    
   
    @IBOutlet weak var textBox: UITextField!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = "FFF"
        
        return cell
    }
    
    @IBAction func sendBTN(_ sender: Any) {
        
        var me = ["email" : Auth.auth().currentUser!.email , "text" : textBox.text  , "image"  : image  ]
        
        DataService.instance.group.child(chatt!).child("messge").childByAutoId().updateChildValues(me)
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        print(chatt)

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
         var memberss = [chatt , Auth.auth().currentUser!.email]
        
        DataService.instance.group.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if me.key == self.chatt {
                    
                   var members = me.childSnapshot(forPath: "members").value as! NSArray
                    
                    self.user = memberss[1]
                    
               
                
                
                }
                
                
                
            }
        })
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            
           for  me in snapChat {
            
            if me.childSnapshot(forPath: "email").value as! String == Auth.auth().currentUser!.email {
                
                
                self.image = me.childSnapshot(forPath: "image").value as! String
                
                
            }
                
                
            }
            
            
        })
        
        
    }

}
