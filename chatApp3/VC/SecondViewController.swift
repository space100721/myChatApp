//
//  SecondViewController.swift
//  chatApp3
//
//  Created by Apple on 2/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

import AudioToolbox



import AVFoundation



class SecondViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  , GetMeHome {
    func getDone(ay: String) {
    
        myTable.reloadData()
        
       
    
        
        
    }
    
    
    
    
      var audioPlayer = AVAudioPlayer()
    
    
    var time4 = 0
    
    var groups : [Group] = []
    
    @IBOutlet weak var myTable: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  groups.count
        
        
    }
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell =  myTable.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! myGroupsTableViewCell
        
        var me = groups[indexPath.row]
      
        
        if me.type == "p" {
            
            
           
                
                if me.texts == "" {
                    
                    cell.groupType.text = "New chat"
                    
                } else {
                    
                     if !userBlocked.contains(me.namez) {
                    
                    cell.groupType.text = me.texts
                        
                        
                        
                     } else {
                        
                        
                    cell.groupType.text =  "[Blocked Text]"
                        
                        
                    }
                    
                }
                
           
            if me.write == true {
                
                
                var mems = me.namez.components(separatedBy: "@")
                var ss = mems[0]
                
                if !userBlocked.contains(me.namez) {
                
                cell.groupType.text = "\(ss) typing...."
                
                }
            }
            
            
            
            if me.name == Auth.auth().currentUser!.email {
                
            
                
              
                
                
                var namm = me.name2.components(separatedBy: "@")
                var meme = namm[0]
                
                cell.groupName.text = meme
                
                
                
                
             
                    
              
                
               
               
            
                var time = me.time2.components(separatedBy: "on")
                cell.stamp.text = time[0]
                
                if me.image2 == "768646" {
                    
                    cell.myImage.image = UIImage(named: "768646")
                    
                } else {
                    
                    cell.myImage.sd_setImage(with: URL(string: me.image2))
                    
                }
        
            } else {
            
      
                var namm = me.name.components(separatedBy: "@")
                var meme = namm[0]
                
                  cell.groupName.text = meme

           
                
                
                
        
                var time = me.time2.components(separatedBy: "on")
                cell.stamp.text = time[0]
                
                if me.image == "768646" {
                    
                    cell.myImage.image = UIImage(named: "768646")
                    
                } else {
                    
                    cell.myImage.sd_setImage(with: URL(string: me.image))
                    
                }
                
            }
        
            
            
            
                
            
            if me.noti == true {
                
                
                
                cell.notiLabel.text = "   "
                cell.notiLabel.backgroundColor = UIColor(red:0.96, green:0.44, blue:0.44, alpha:1.0)
                
                cell.notiLabel.layer.borderColor = UIColor.white.cgColor
                
            } else {
                
                cell.notiLabel.text = ""
                  cell.notiLabel.backgroundColor = UIColor.clear
                  cell.notiLabel.layer.borderColor = UIColor.clear.cgColor
            }
          
        }
            
            
        
        
        
        
        
        
        if me.type == "g" {
            
            
         cell.groupName.text = me.name
            
            
            
            if me.texts == "" {
                
                cell.groupType.text = "New Group"
                
            } else {
                
                if !userBlocked.contains(me.namez) {
                
                
                cell.groupType.text =  me.texts
                    
                } else {
                    
                    
                    
                    cell.groupType.text =  "[Blocked Text]"
                    
                }
                
            }
                 
                    
            if me.write == true {
                
                var mems = me.namez.components(separatedBy: "@")
                var ss = mems[0]
                
                if !userBlocked.contains(me.namez) {
                    
                cell.groupType.text = "\(ss) typing ...."
                    
                }
            }
                    
                    
                    
                    
         
            var time = me.time2.components(separatedBy: "on")
            cell.stamp.text = time[0]
            
            if me.image == "768646" {
                
                cell.myImage.image = UIImage(named: "768646")
                
            } else {
                
                cell.myImage.sd_setImage(with: URL(string: me.image))
                
            }
            
            
            
            if me.noti == true {
                print("pppppp")
                
                
                cell.notiLabel.text = ""
                cell.notiLabel.backgroundColor = UIColor(red:0.96, green:0.44, blue:0.44, alpha:1.0)
                
                cell.notiLabel.layer.borderColor = UIColor.white.cgColor
            } else {
                
                cell.notiLabel.text = ""
                   cell.notiLabel.backgroundColor = UIColor.clear
                cell.notiLabel.layer.borderColor = UIColor.clear.cgColor
                
            }
        
            
            
            
        }
            
            
            
    
        
        
        
        
        return cell
        
    }
    
    
    var numm = ""
 
    
    
    
    var userBlocked : [String] = []
    
    
    func blocking () {
        
        DataService.instance.user.observe(.value , with : { (snapChat) in
            
            self.userBlocked = [String]()
            
            DataService.instance.user.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
                
                guard let snapp = snapChat.children.allObjects as? [DataSnapshot] else {return}
                for me in snapp {
                    
                    if me.key == Auth.auth().currentUser?.uid {
                        
                        if me.hasChild("block") {
                            
                            self?.userBlocked = me.childSnapshot(forPath: "block").value as! NSArray as! [String]
                            
                            
                        }
                        
                    }
                    
                    
                }
                
            }
            
            
        })
        
        
        
        
    }
    
    
    
    
    
    
    
        
     override func viewWillAppear(_ animated: Bool) {
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).observe(.value , with : { (snapChat) in
            
            DataService.instance.notifiing()
            DataService.instance.blocking()
            
            
        })
        
        
        blocking()
        
        
        
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["view" : "second" ])
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).observe( .value , with : { (snapChat) in
            var me = snapChat
            self.numm = me.childSnapshot(forPath: "view").value as! String
            
        })
        
        
        
        
        
        
        
        
        
        DataService.instance.user.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            guard let snap =  snap.children.allObjects as? [DataSnapshot] else {return}
            var mee = Texts()
            for me in snap {
                
                if me.hasChild("email") {
                    
                    
                    
                } else {
                    
                    mee.key = me.key
                    
                    if Auth.auth().currentUser?.uid  != mee.key {
                    
                    
                    DataService.instance.user.child(mee.key).removeValue()
                    
                    
                    }
                    
                }
                
                
                
            }
        }
        
        
       
        
   
        
        
     
        
     
     
        self.time4 = 0
        
    
       
            
        
        DataService.instance.group.observe( .value , with : { (snapChatt) in
            
            var mee = snapChatt.value as! NSDictionary
            var mes = mee.allKeys
        
            
            for k in mes {
                
                
                print(k)
                var moo = mee[k] as! NSDictionary
                
              
                
                 var heyy =  moo["members"] as! NSArray
                
                if heyy.contains(Auth.auth().currentUser!.email) {
              
                
          
         
            
         
            
          Timer.scheduledTimer(withTimeInterval: 0.5 , repeats: false) { (timer) in
         
            
            DataService.instance.downloadGroup(handle: { (maGroup) in
                
            
                self.groups = maGroup
                
              
             
                self.myTable.reloadData()
            
                
            })
            
                    }
                
            }
            
            
            }
          
        
        })
 
 
        
          
 
 
        
        
    }
    
    
    
    @IBAction func startGroup(_ sender: Any) {
        
        
        
        performSegue(withIdentifier: "group", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         myTable.deselectRow(at: indexPath, animated: true)
        var myGroup = groups[indexPath.row]
        
       
        
        performSegue(withIdentifier: "chat", sender: myGroup)
            
        
        
       
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chat" {
        var firstVC = segue.destination as! chatViewController
        firstVC.chat = sender as! Group
        firstVC.delegte = self
        }
        
        
        
        
        if segue.identifier == "chat21" {
            var firstVC = segue.destination as! chat21ViewController
            firstVC.chat = sender as! Group
          
        }
        
        
        
    }
    
    
    
    var groupID : [String] = []
    
    
    @objc func loadList(){
        //load data here
        self.myTable.reloadData()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        

        
        
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    
    
  
        
        
       
        DataService.instance.group.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            guard let snap = snap.children.allObjects as? [DataSnapshot] else {return}
            
            for me in snap {
                
                if me.hasChild("members") {
                
                var groupM = me.childSnapshot(forPath: "members").value as! NSArray
                
                if groupM.contains(Auth.auth().currentUser?.email) {
                    
                    var id = me.key
                    
                    self?.groupID.append(id)
                    
                 
                    
                    
                    
                    
                }
                
                
                
                }
                
                
            }
            
            DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["groups" : self?.groupID ])
            
            
        }
    
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
 
 

}

