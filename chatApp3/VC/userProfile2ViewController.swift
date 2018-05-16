//
//  userProfile2ViewController.swift
//  chatApp3
//
//  Created by Apple on 3/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

import SDWebImage

class userProfile2ViewController: UIViewController {
    @IBOutlet weak var chatting: UIButton!
    @IBOutlet weak var IamIn: UILabel!
    
    @IBOutlet weak var gotBlocked: UILabel!
    @IBOutlet weak var iconz: UIImageView!
    @IBOutlet weak var chatz: UIButton!
    var user : Texts?
    var image : String?
    var lights : String?
    
    var work = false
    
    var ss : Group?
    
    var myList : [String] = []
    
  
    var ids : String?
    @IBOutlet weak var labellName: UILabel!
    var keys : Group?
    
    var blocks : [String] = []
    
    var show : Bool?
    
    @IBOutlet weak var myImage: circleImage!
    var blockss : [String] = []
    
    
     var arrays2  : [String] = []
    
    var arrays  : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

      
    }

    
    @objc func showMeBig () {
        performSegue(withIdentifier: "bigImage", sender: user?.image)
    }
 
    override func viewWillAppear(_ animated: Bool) {
        
       
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
       
        
        myImage.isUserInteractionEnabled = true
        
        var rec = UITapGestureRecognizer(target: self, action: #selector(showMeBig))
        myImage.addGestureRecognizer(rec)
        
        var meme = user?.email.components(separatedBy: "@")
        labellName.text = meme?[0]
        
        
        myList = [String]()
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                if me.key == Auth.auth().currentUser?.uid {
                    
                    if me.hasChild("block") {
                        
                        self.myList = me.childSnapshot(forPath: "block").value as? NSArray as! [String]
                    }
                        
                    
                        
                        if self.myList.contains(self.user!.email) {
                            
                            self.chatting.isHidden = true
                            self.chatz.isHidden = true
                            self.iconz.isHidden = true
                            
                            self.blockBTN.isEnabled = false
                            
                            self.gotBlocked.text = "You Blocked This User"
                            
                            
                            self.gotBlocked.isHidden = false
                            
                          
                            
                            self.work = true
                            
                        } 
                        
                        print("@@!3\(self.myList)")
                        
                        
                        
                        
                        
                    
                    
                }
            }
        })
        
        
        
        
        
        
        
        if self.work == false {
        
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                   print("\(self.user?.email)ccccssssksksks")
                
                
                if me.childSnapshot(forPath: "email").value as? String == self.user?.email {
                    
                    print("\(self.user?.email)ccccssssksksks8")
                    
                    if me.hasChild("block") {
                    
                        self.blockss = (me.childSnapshot(forPath: "block").value as! NSArray) as! [String]
                        
                    }
                    
                 
                    self.ids = me.key
                    
                    if self.blockss.contains(Auth.auth().currentUser!.email!) {
                        
                        self.chatting.isHidden = true
                        self.chatz.isHidden = true
                        self.iconz.isHidden = true
                        self.gotBlocked.isHidden = false
                        
                         self.vieww4.isHidden = false
                        self.vieww1.isHidden = false
                        self.vieww3.isHidden = false
                        
                        
                    } else {
                        
                        if Auth.auth().currentUser?.email == self.user?.email {
                            
                             self.vieww4.isHidden = true
                            
                            
                        } else {
                        
                        self.vieww4.isHidden = false
                        self.vieww1.isHidden = false
                        self.vieww3.isHidden = false
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
            }
        })
        
        }
        
        
        
        Timer.scheduledTimer(withTimeInterval: 1 , repeats: false) { (timer) in
        
            if self.ids != nil {
        
            DataService.instance.user.child(self.ids!).observe( .value , with :  { (snapChat) in
        
            var me = snapChat
            
                if me.hasChild("Online") {
                    self.lights = me.childSnapshot(forPath: "Online").value as! String
                    
                
                    if self.lights == "true" {
                        
                        self.IamIn.text = "Online"
                        
                    } else {
                        
                        
                        self.IamIn.text = ""
                        
                    }
                    
                    
                }
            
                
            
            
        })
                
            }
        
    }
        
        
        
        
        
        arrays =  [Auth.auth().currentUser!.email! , user!.email]
        arrays2 =  [ user!.email , Auth.auth().currentUser!.email! ]
        DataService.instance.group.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if me.childSnapshot(forPath: "type").value as! String == "p" {
                
                if (me.childSnapshot(forPath: "members").value as! NSArray) as! Array<String> == self.arrays  ||  (me.childSnapshot(forPath: "members").value as! NSArray) as! Array<String> == self.arrays2  ||  me.childSnapshot(forPath: "name").value as! String  ==  self.user!.email  &&  me.childSnapshot(forPath: "name2").value as! String  == Auth.auth().currentUser!.email || me.childSnapshot(forPath: "name").value as! String  ==  Auth.auth().currentUser!.email  &&  me.childSnapshot(forPath: "name2").value as! String == self.user!.email  {
                    
                    var meme = Group()
                    
                    meme.keyy = me.key
                    
                    if me.hasChild("image") {
                        
                        meme.image = me.childSnapshot(forPath: "image").value as! String
                        
                    }
                    
                    if me.hasChild("image2") {
                        
                        meme.image2 = me.childSnapshot(forPath: "image2").value as! String
                        
                    }
                    
                    
                    meme.name = me.childSnapshot(forPath: "name").value as! String
                    meme.name2 = me.childSnapshot(forPath: "name2").value as! String
                    
                    meme.members = me.childSnapshot(forPath: "members").value as! NSArray
                    meme.texts = me.childSnapshot(forPath: "last").value as! String
                    meme.time = me.childSnapshot(forPath: "timme").value as! Double
                    meme.time2 = me.childSnapshot(forPath: "time2").value as! String
                    
                    meme.type = me.childSnapshot(forPath: "type").value as! String
                    
                    
                    self.keys = meme
                    self.show = true
                    
                    print("yep")
                    
                    }
                    
                } else {
                    
                    
            
                   
                  
                        print("f")
                    
                    
                }
            }
        })
        
        
        
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if me.key == Auth.auth().currentUser?.uid {
                    
                    self.image = me.childSnapshot(forPath: "image").value as! String
                    
                }
                
            }
        })
        
        
        
        
        
        
        
   
        
        
        
        
       
        
        if user?.image == "768646" {
            
            myImage.image = UIImage(named: "768646")
            
            
        } else {
            
            myImage.sd_setImage(with: URL(string: user!.image))
            
        }
        
        if user?.email == Auth.auth().currentUser?.email {
            
            vieww4.isHidden = true
 
            vieww1.isHidden = true
            vieww3.isHidden = true
            
        }
        
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                if me.key == Auth.auth().currentUser?.uid {
                    
                    if me.hasChild("block") {
                    
                    var arrayBloacks = me.childSnapshot(forPath: "block").value as! NSArray
                    
                    self.blocks = arrayBloacks as! [String]
                        
                        
                
                        
                    
                        
                    
                    
                    }
                    
                }
            }
        })
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if me.key == Auth.auth().currentUser?.uid {
                
                self.image = me.childSnapshot(forPath: "image").value as! String
                    
                }
                
            }
        })
        
        
        
        
    }
    
    @IBAction func blockBTN(_ sender: Any) {
        
        var alart = UIAlertController(title: "Block", message: "Do you want to Block this user", preferredStyle: .alert)
        var action = UIAlertAction(title: "Block", style: .default) { (alert) in
            
            self.blocks.append(self.self.user!.email)
            
            DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["block" : self.blocks])
            
            self.showMe(show: true)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
                
                self.blockBTN.isEnabled = false
                
                var story = self.storyboard?.instantiateViewController(withIdentifier: "firstVC")
                self.present(story!, animated: true, completion: nil)
                
                self.showMe(show: false)
                
            }
            
            
            
            
        }
        
        var action2 =  UIAlertAction(title: "Cancel", style: .default) { (alert) in
            self.view.endEditing(true)
        }
        
        alart.addAction(action)
        alart.addAction(action2)
        
        present(alart, animated: true, completion: nil)
        
    
        
    }
    
    @IBOutlet weak var blockBTN: UIButton!
    @IBOutlet weak var reportBTN: UIButton!
    @IBAction func reportBTN(_ sender: Any) {
        
        var alart = UIAlertController(title: "Report", message: "Do you want to Report this user", preferredStyle: .alert)
        var action = UIAlertAction(title: "Report", style: .default) { (alert) in
            
            DataService.instance.report.childByAutoId().updateChildValues(["report" : self.user?.email])
            
            self.showMe(show: true)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
                
                self.blockBTN.isEnabled = false
                
                
                var story = self.storyboard?.instantiateViewController(withIdentifier: "firstVC")
                self.present(story!, animated: true, completion: nil)
                
                
                
                self.showMe(show: false)
                
            }
            
            
        }
        
        
        var action2 =  UIAlertAction(title: "Cancel", style: .default) { (alert) in
            self.view.endEditing(true)
        }
        
        
        
        alart.addAction(action)
        alart.addAction(action2)
        
        present(alart, animated: true, completion: nil)
        
        
   
        
        
    }
    
    @IBOutlet weak var vieww1: UIView!
    @IBOutlet weak var vieww3: UIView!
    @IBOutlet weak var vieww4: UIView!
    
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func chatting(_ sender: Any) {
        
        showMe(show: true)
        
        
        
        
            if self.show == true {
                
                Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { (timer) in
         
                print("true")
                
                self.performSegue(withIdentifier: "lastWay", sender: self.keys )
                
                self.showMe(show: false)
                
                
                
            
        }
            
            
            } else {
    
    
    
             
                 let currentTimeStamp = Date().toMillis()
                var id = NSUUID().uuidString
             
                
                
                DataService.instance.group.child(id).updateChildValues(["members" : [Auth.auth().currentUser?.email , self.user?.email] , "name" : self.user?.email , "left" : "" , "name2" : Auth.auth().currentUser?.email ,  "image" : self.user?.image , "image2" : self.image  , "boss" : Auth.auth().currentUser?.email , "timme" : currentTimeStamp , "time2" : "" , "last" : "" , "type"  : "p"  , "noti" : true  , "uidd" : Auth.auth().currentUser?.uid])
                
    
               Timer.scheduledTimer(withTimeInterval: 4 , repeats: false) { (timer) in
    
                var meme = Group()
                
                meme.keyy = id
                
               
                    
                meme.image = self.user!.image
                    
          
                    
                meme.image2 = self.image!
           
                meme.name = self.user!.email
                meme.name2 = (Auth.auth().currentUser?.email)!
                
                meme.members =  [Auth.auth().currentUser?.email , self.user?.email]
                    
             
                meme.time =  currentTimeStamp!
                    
                meme.time2 = ""
                
                meme.type = "p"
            
                meme.noti = true
    
                meme.texts = ""
                
             
                
                
                
                self.show = true
                
                print("yep")
                
                self.ss = meme
                
                
                
            
            self.performSegue(withIdentifier: "lastWay", sender: self.ss )
            
            self.showMe(show: false)
            
    }
        
            
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "bigImage" {
            
            
            var firstVC = segue.destination as! bigImageViewController
            firstVC.users = sender as? String
            
        }
        
    
        
        
        if segue.identifier == "lastWay" {
            var firstVC = segue.destination as! chatViewController
            firstVC.chat = sender as? Group
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
