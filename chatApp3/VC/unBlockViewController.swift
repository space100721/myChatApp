//
//  unBlockViewController.swift
//  chatApp3
//
//  Created by Apple on 3/5/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

class unBlockViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var blocks : [String] = []
    var users : [Texts] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
        
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "666cell", for: indexPath) as! unBlockingTableViewCell
        var user = users[indexPath.row]
        
        var meme = user.email.components(separatedBy: "@")
        
        
        cell.emailLabel.text = meme[0]
        
        if user.image == "768646" {
            
            cell.myImage.image = UIImage(named: "768646")
            
        } else {
            
            cell.myImage.sd_setImage(with: URL(string: user.image))
            
        }
        
        
        return cell
    }
    
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
         myTable.deselectRow(at: indexPath, animated: true)
        
        saveBTN.isHidden = false
        
        
        
        
        var use = users[indexPath.row]
        
        
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            
            
            
            if cell.accessoryType == .checkmark{
                
                
                cell.accessoryType = .none
                
                
            } else {
                
                
                
                
                
                cell.accessoryType = .checkmark
            }
        }
        
        
        
        
        
        
        
        
        
        if !blocks.contains(use.email) {
            
           
            
            
             blocks.append(use.email)
            
           
            
            
        } else {
            
            
            blocks = blocks.filter({   $0 != use.email })
            
        }
        
        
     
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        

        saveBTN.isHidden = true
    
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if me.key == Auth.auth().currentUser?.uid {
                    
                    if me.hasChild("block") {
                
                var meme = me.childSnapshot(forPath: "block").value as! NSArray
                
                
                    self.blocks = meme as! [String]
                        
                    }
                
            }
                
            }
            
            
        
    })
        
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                var meme = Texts()
                
                meme.email = me.childSnapshot(forPath: "email").value as! String
                
                
                if self.blocks.contains(meme.email) {
                    
                    
                     meme.image = me.childSnapshot(forPath: "image").value as! String
                    
                    
                    self.users.append(meme)
                    
                    
                    
                }
                
                
            }
            
            self.myTable.reloadData()
            
            
            
        })
        
        
        
        
        
    }

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBOutlet weak var saveBTN: UIButton!
    @IBAction func saveBTN(_ sender: Any) {
        
        showMe(show: true)
        DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["block" : blocks ])
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            self.dismiss(animated: true, completion: nil)
            DataService.instance.blocking2()
            DataService.instance.blocking()
        }
    }
    
    
    @IBAction func dismissing(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    


}
