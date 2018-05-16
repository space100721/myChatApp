//
//  proFileViewController.swift
//  chatApp3
//
//  Created by Apple on 2/21/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class proFileViewController: UIViewController {
    
    @IBOutlet weak var lights: UILabel!
    @IBOutlet weak var vieww1: UIView!
    @IBOutlet weak var vieww2: UIView!
    @IBOutlet weak var iconz: UIImageView!
    @IBOutlet weak var userBlocked: UILabel!
    @IBOutlet weak var vieww3: UIView!
    @IBOutlet weak var chatz: UIButton!
    var work = false
    var user : Texts?
    var ids : String?
    var lightz : String?
    var myList : [String] = []
    var keys  : Group?
    var show : Bool?
    var image : String?
    var ss : Group?
    var userr : String?
    
    var texts : [Texts] = []
    
    var arrays2  : [String] = []
    
    var arrays  : [String] = []
    
    var blocks : [String] = []
    
    
    
    var blocked : [String] = []

    @IBOutlet weak var viewwz: UIView!
    @IBOutlet weak var myImage: circleImage!
    @IBOutlet weak var userEmail: UILabel!
    
    @objc func choseImage() {
        performSegue(withIdentifier: "nora", sender: user?.image)
        print("heyy")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        
        
        myImage.isUserInteractionEnabled = true
        
        var rec = UITapGestureRecognizer(target: self, action: #selector(choseImage))
        myImage.addGestureRecognizer(rec)
        
        print(user?.email)
   
        
    }
    
    @IBOutlet weak var disMe: UIButton!
    @IBAction func disMe(_ sender: Any) {
       
        
        dismiss(animated: true, completion: nil)
            
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    @IBOutlet weak var buttonReport: UIButton!
    @IBAction func buttonReport(_ sender: Any) {
        
        
        var alart = UIAlertController(title: "Report", message: "Do you want to Report this user", preferredStyle: .alert)
        var action = UIAlertAction(title: "Report", style: .default) { (alert) in
            
        
        
        
        
            var reported = ["report" : self.user?.email ]
        DataService.instance.report.childByAutoId().updateChildValues(reported)
            
            
            self.showMe(show: true)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
                self.showMe(show: false)
                
                   self.dismiss(animated: true, completion: nil)
                
            })
            
            
            
        }
        
        
        
        var action2 =  UIAlertAction(title: "Cancel", style: .default) { (alert) in
            self.view.endEditing(true)
        }
        
        
        
        alart.addAction(action)
        alart.addAction(action2)
        
        present(alart, animated: true, completion: nil)
        
        
        
        
    }
    @IBOutlet weak var blockBTN: UIButton!
    @IBAction func blockBTN(_ sender: Any) {
        
        var alart = UIAlertController(title: "Block", message: "Do you want to Block this user", preferredStyle: .alert)
        var action = UIAlertAction(title: "Block", style: .default) { (alert) in
        
            var me = self.user?.email
        
        print("33")
        
            self.blocked.append((self.user?.email)!)
        
            var blockk = [ "block" : self.blocked ]
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(blockk)
            
            self.showMe(show: true)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
                self.showMe(show: false)
                
              
                self.dismiss(animated: true, completion: nil)
                
                
                
            })
            
            
            
            
            }
            
            
            
            var action2 =  UIAlertAction(title: "Cancel", style: .default) { (alert) in
                self.view.endEditing(true)
            }
            
            
            
            alart.addAction(action)
            alart.addAction(action2)
            
            present(alart, animated: true, completion: nil)
        
        
        
        
        
        
            
            
            
    }
    
   
    @IBOutlet weak var maImage: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        
       
        if Auth.auth().currentUser?.email == self.user?.email {
            
            
            self.vieww1.isHidden = true
            self.vieww2.isHidden = true
            
            self.vieww3.isHidden = true
            
            
        }
      
        
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        myList = [String]()
        
        
        if user?.email != nil {
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                if me.key == Auth.auth().currentUser?.uid {
                    
                    if me.hasChild("block") {
                        
                        var arrayBloacks = me.childSnapshot(forPath: "block").value as! NSArray
                        
                        self.myList = arrayBloacks as! [String]
                        
                        
                        if self.myList.contains(self.user!.email) {
                            
                            self.chatting.isHidden = true
                            self.chatz.isHidden = true
                            self.iconz.isHidden = true
                            
                            
                             self.blockBTN.isEnabled = false
                            
                            self.userBlocked.text = "You Blocked This User"
                            self.userBlocked.isHidden = false
                            
                            self.vieww1.isHidden = false
                            self.vieww2.isHidden = false
                            self.vieww3.isHidden = false
                            self.work = true
                            
                        }
                        
                        print("@@!3\(self.myList)")
                        
                        
                        
                        
                        
                    }
                    
                }
            }
        })
        
        }
        
        
        viewwz.isHidden = true
        
        
        if userr != nil {
            
            viewwz.isHidden = false
            
            print("000")
            
            if userr == "768646" {
                
                maImage.image = UIImage(named: "768646")
    
                
                
            } else {
                
                maImage.sd_setImage(with: URL(string: userr! ))
                
            }
            
        } else {
     
        
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
        
        
        
        
        
        
        
            if self.work == false {
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                print("\(self.user?.email)ccccssssksksks")
                
                
                if me.childSnapshot(forPath: "email").value as? String == self.user?.email {
                    
                    self.ids = me.key
                    
                    print("\(self.user?.email)ccccssssksksks8")
                    
                    if me.hasChild("block") {
                        
                        self.blocks = (me.childSnapshot(forPath: "block").value as! NSArray) as! [String]
                        
                    }
                    
                    
                    
                    if self.blocks.contains(Auth.auth().currentUser!.email!) {
                        
                        self.chatting.isHidden = true
                        self.iconz.isHidden = true
                        
                        self.chatz.isHidden = true
                        self.userBlocked.isHidden = false
                        
                        
                        self.vieww1.isHidden = false
                        self.vieww2.isHidden = false
                        
                        self.vieww3.isHidden = false
                        
                        
                        
                        
                        
                    } else {
                        
                      
                        
                        
                        
                        if Auth.auth().currentUser?.email == self.user?.email {
                            
                            
                            self.vieww1.isHidden = true
                            self.vieww2.isHidden = true
                            
                            self.vieww3.isHidden = true
                            
                            
                        } else {
                            
                            self.vieww1.isHidden = false
                            self.vieww2.isHidden = false
                            
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
                            self.lightz = me.childSnapshot(forPath: "Online").value as! String
                            
                            
                            if self.lightz == "true" {
                                
                                self.lights.text = "Online"
                                
                            } else {
                                
                                
                                self.lights.text = ""
                                
                            }
                            
                            
                        }
                        
                        
                        
                        
                    })
                    
                }
                
            }
            
        
        
        
        
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if me.key == Auth.auth().currentUser?.uid {
                    
                    self.image = me.childSnapshot(forPath: "image").value as! String
                    
                }
                
            }
        })
        
        
        
        
        arrays =  [Auth.auth().currentUser!.email! , user!.email]
        arrays2 =  [ user!.email , Auth.auth().currentUser!.email! ]
        DataService.instance.group.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if (me.childSnapshot(forPath: "members").value as! NSArray) as! Array<String> == self.arrays  ||  (me.childSnapshot(forPath: "members").value as! NSArray) as! Array<String> == self.arrays2 ||  me.childSnapshot(forPath: "name").value as! String  ==  self.user!.email  &&  me.childSnapshot(forPath: "name2").value as! String  == Auth.auth().currentUser!.email || me.childSnapshot(forPath: "name").value as! String  ==  Auth.auth().currentUser!.email  &&  me.childSnapshot(forPath: "name2").value as! String == self.user!.email {
                    
                    self.show = true
                    
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
                    
                    
                }
            }
        })
        
        
        
        
        var meme = user?.email.components(separatedBy: "@")
        userEmail.text = meme?[0]
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            
            var mee = Texts()
            
            for me in snapChat {
                
              
                
                if me.childSnapshot(forPath: "email").value as! String == self.user!.email {
                    
                  
           
                    mee.image = me.childSnapshot(forPath: "image").value as! String
                  
                    
                    if mee.image == "768646" {
                        
                        self.myImage.image = UIImage(named: "768646")
                        
                        
                    } else {
                        
                        self.myImage.sd_setImage(with: URL(string: mee.image))
                        
                        //
                    }
                    
                    
                    
                }
            }
        })
        
        
        
        
        
        
        
        
        if user?.email == Auth.auth().currentUser?.email {
            
            blockBTN.isHidden = true
            buttonReport.isHidden = true
            
        }
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                if me.key == Auth.auth().currentUser!.uid {
                    
                    if me.hasChild("block") {
                        
                        print("heyyyyyy")
                        
                        let block = me.childSnapshot(forPath: "block").value as! NSArray
                        
                        
                        self.blocked = block as! [String]
                        
                        print("\(self.blocked)hhh")
                        
                    }
                    
                }
            }
        })
        
        }
        
        
    }
    
    
    
    @IBOutlet weak var chatting: UIButton!
    @IBAction func chatting(_ sender: Any) {
        
        showMe(show: true)
        
        
            
            if self.show == true {
                
           Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { (timer) in
                    
            self.performSegue(withIdentifier: "erboh", sender: self.keys)
            
            self.showMe(show: false)
            
        
        
        
            
                }
            
            
        } else {
            
           
                
                let currentTimeStamp = Date().toMillis()
                var id = NSUUID().uuidString
                
                
                
                DataService.instance.group.child(id).updateChildValues(["members" : [Auth.auth().currentUser?.email , self.user?.email] , "name" : self.user?.email  , "left" : "" ,  "name2" : Auth.auth().currentUser?.email ,  "image" : self.user?.image , "image2" : self.image  , "boss" : Auth.auth().currentUser?.email , "timme" : currentTimeStamp , "time2" : "" , "last" : "" , "type"  : "p"  , "noti" : true  , "uidd" : Auth.auth().currentUser?.uid])
                
                
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
                    
                    
                    
                    
                    self.performSegue(withIdentifier: "erboh", sender: self.ss )
                    
                    self.showMe(show: false)
                
                
                
                }
            
        
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
        
        
        if segue.identifier == "erboh" {
            
            var firstVC = segue.destination as! chatViewController
            firstVC.chat = sender as? Group
            
        }
        
        
        if segue.identifier == "nora" {
            
            var firstVC = segue.destination as! bigImageViewController
            firstVC.users = sender as? String
            
        }
        
        
        
        
        
    }
    
    

    
    
    

}
