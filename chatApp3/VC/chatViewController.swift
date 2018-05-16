//
//  chatViewController.swift
//  chatApp3
//
//  Created by Apple on 2/21/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

import AVFoundation

protocol GetMeHome {
    func getDone (ay : String)
}


var maha : String?


class chatViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate  {
    @IBOutlet weak var maHight: NSLayoutConstraint!
    @IBOutlet weak var linez: UIView!
    @IBOutlet weak var highting: NSLayoutConstraint!
    
    @IBOutlet weak var writing: UILabel!
    @IBOutlet weak var lights: UILabel!
    
       var audioPlayer = AVAudioPlayer()
    
    
    var emaill = ""
    var lightz : String?
    
    var timer7 = 0
    
    var time4 = 0
    var ids : String?
    var ids2 : String?
    var timer3 = 0
    
    var maImage = ""
    var meme : Bool?
    var namez = ""
    var writerName = ""
    
    var chat : Group?
    var messge : [Texts] = []
    
    var mem : [String] = []
    

    var kai : String?
    
    var name = ""
    var name2 = ""
    
    var image : String?
    var image2 : String?
    
    var timer = 0
    var delegte : GetMeHome?
    var uids : [String] = []
    
    
    var members : [String] = []
   
    
    var blocked : [String] = []
    

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
        
    }
    
    @IBAction func buttonTake(_ sender: Any) {
        
        if chat?.type == "g" {
        
        performSegue(withIdentifier: "mess", sender: chat?.keyy)
            
        }
    }
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
      
        dismiss(animated: true, completion: nil)
        delegte?.getDone(ay: "ay")
    }
    


        
    
    func deleteExtra() {
        
        DataService.instance.group.child(chat!.keyy).child("messge").observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat =  snapChat.children.allObjects as? [DataSnapshot] else {return}
            
            for me in snapChat {
                
                
                
                
                var meh = me.key
                
                self.gg.append(meh)
                
                if self.gg.count >= 30 {
                    
                    DataService.instance.group.child(self.chat!.keyy).child("messge").queryLimited(toFirst : 10).observeSingleEvent(of: .value , with : { (snapChatta) in
                        
                        guard let snapChat2 =  snapChatta.children.allObjects as? [DataSnapshot] else {return}
                        
                        for me in snapChat2 {
                            
                            
                            print("heyyyyyah")
                            
                            DataService.instance.group.child(self.chat!.keyy).child("messge").child(me.key).removeValue()
                            
                        }
                        
                        
                        
                        
                    })
                    
                    
                    
                    
                    
                    
                    
                }
                
                
            }
            
            
            
            
        })
        
        
    }
        
        

    
    
    

    @IBOutlet weak var emailGroup: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var myTable: UITableView!
 
    @IBOutlet weak var sendBTN: UIButton!
    @IBOutlet weak var textBox: textBox!
    
    
    @IBOutlet weak var vieww: UIView!
    @IBOutlet weak var groupImage: circleImage!
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
            
          
        
        return messge.count
        
        
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "Cell6", for: indexPath) as! chatTableViewCell
        
        
        let cell2 = myTable.dequeueReusableCell(withIdentifier: "cellChat2", for: indexPath) as! chatCell2TableViewCell
        
         let cell3 = myTable.dequeueReusableCell(withIdentifier: "picCell", for: indexPath) as! TableViewCellpicImage
        
         let cell4 = myTable.dequeueReusableCell(withIdentifier: "imageCell2", for: indexPath) as! TableViewCellimage2
        
        
        var me = messge[indexPath.row]
        
    
       var email = me.email.components(separatedBy: "@")
        
     
        if me.email == Auth.auth().currentUser?.email {
            
            var time = me.time2.components(separatedBy: "on")
            
            cell2.stamp.text = time[0]
            
           
            cell2.textingLabel.text = me.text
            
       
            
            
         if me.myImage != "" {
            
            var time = me.time2.components(separatedBy: "on")
            
            cell3.stamp.text = time[0]
            
            
            
            if me.myImage == "768646" {
                
                cell3.myImage.image = UIImage(named: "768646")
                
            } else {
                
                cell3.myImage.sd_setImage(with: URL(string: me.myImage))
                
            }
            
            
            
               return cell3
            
            }
            
            
         
            
            
            
            return cell2
            
        }
        
       
     
        
        
        cell.chatText.text = me.text
        
        
        var time = me.time2.components(separatedBy: "on")
        
        cell.span.text = time[0]
        
       
        
        
        if me.image == "768646" {
            
            cell.myImage.image = UIImage(named: "768646")
            
        } else {
            
            cell.myImage.sd_setImage(with: URL(string: me.image))
            
        }
        
        
        
        if me.myImage !=  "" {
            
            
            var time = me.time2.components(separatedBy: "on")
            
            cell4.stamp.text = time[0]
            
            
            
            
         
            
            
        
            
            if me.myImage == "768646" {
                
                cell4.myImages.image = UIImage(named: "768646")
                
            } else {
                
                cell4.myImages.sd_setImage(with: URL(string: me.myImage))
                
            }
            
            
            if me.image == "768646" {
                
                cell4.maImage.image = UIImage(named: "768646")
                
            } else {
                
                cell4.maImage.sd_setImage(with: URL(string: me.image))
                
            }
            
            
            
            
            
            return cell4
            
            
        }
        
        
        return cell
        
        
    }
    
    
    
    
    @IBAction func sendImage(_ sender: Any) {
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
  
        
    var new =  info[UIImagePickerControllerOriginalImage] as! UIImage
        
        var meme = new.lowestQualityJPEGNSData
    
        print("@@@\(meme)")

        Storage.storage().reference().child("image").child(NSUUID().uuidString).putData( meme as Data , metadata: nil) { (data, error) in
            if error != nil {
                
         
                
            } else {
                
                var way = data?.downloadURL()?.absoluteString
                
                self.myway(path: way!)
               
                
                
                
            }
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    func myway( path : String) {
        
      
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
            formatter.amSymbol = "AM"
            formatter.pmSymbol = "PM"
            
            let dateString = formatter.string(from: Date())
            
            
            let currentTimeStamp = Date().toMillis()
            
            var emaaill = Auth.auth().currentUser!.email!.components(separatedBy: "@")
        
       
        var cam = "📷"
            
            var text = ["text" : "" ,  "email" : Auth.auth().currentUser!.email , "image" : image  , "last" :   "\(Auth.auth().currentUser!.email!) : \(textBox.text!)"  , "timme" : currentTimeStamp  ,  "time2" : dateString  , "boss" : chat?.boss , "uidd" : Auth.auth().currentUser!.uid  , "myImage" : path ] as [String : Any]
            
            
            DataService.instance.group.child(chat!.keyy).child("messge").childByAutoId().updateChildValues(text)
            
           DataService.instance.group.child(chat!.keyy).updateChildValues(["last" : "\(emaaill[0]):\(cam)"])
        
            
            DataService.instance.group.child(chat!.keyy).updateChildValues(["timme" : currentTimeStamp])
            DataService.instance.group.child(chat!.keyy).updateChildValues(["time2" : dateString])
            
        var memee = ["new" : chat?.keyy , "namez" : Auth.auth().currentUser!.email ]
            
        
   
            for memea in self.keyMembers {
                
                if memea.key != Auth.auth().currentUser!.uid {
                    
                    if !publicBlock.contains(memea.key) {
                       
                            if !userBlocked.contains(memea.email) {
                                
                    DataService.instance.user.child(memea.key).child("noti").childByAutoId().updateChildValues(memee)
                 
                                
                                
                     
                        }
                    }
                    
                }
                
                
                
                
            }
            
       
        
    }
    
   
    
  

    
    
    
    var picker = UIImagePickerController()
    

    
    var oldUID : [String] = []
    
    var numm = ""
    
   
    
    
    
    var emailss : [String] = []
    var noRole : [Texts] = []
    
  
    
    
    
    
    var userBlocked : [String] = []
       var publicBlock : [String] = []
    
    
    func blocking () {
        
      
            
            self.userBlocked = [String]()
            
            DataService.instance.user.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
                
                guard let snapp = snap.children.allObjects as? [DataSnapshot] else {return}
                for me in snapp {
                    
                    if me.key == Auth.auth().currentUser?.uid {
                        
                        if me.hasChild("block") {
                            
                            self?.userBlocked = me.childSnapshot(forPath: "block").value as! NSArray as! [String]
                            
                            
                            
                          
                            
                            
                        }
                        
                        
                        self?.image = me.childSnapshot(forPath: "image").value as? String
                        
                        if me.hasChild("groups") {
                            
                            
                            self?.oldUID = (me.childSnapshot(forPath: "groups").value as? NSArray) as! [String]
                            
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                    
                }
                
            }
        
        
        self.publicBlock = [String]()
        
        DataService.instance.user.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            
            guard let snapp = snap.children.allObjects as? [DataSnapshot] else {return}
            for me in snapp {
                
                var key = me.key
                
                if me.key != Auth.auth().currentUser!.uid {
                    
                    if me.hasChild("block") {
                        
                        var kk  = me.childSnapshot(forPath: "block").value as? NSArray as! [String]
                        
                        
                        
                        
                        if kk.contains(Auth.auth().currentUser!.email!) {
                            
                            self?.publicBlock.append(me.key)
                            
                      
                            
                        }
                        
                    }
                    
                }
            }
            
            
            
            
        }
        
        
        
            
            
        
    }
 
    
    
    var keyMembers : [Texts] = []
    
    var keyMembers2 : [String] = []
    
    var gg : [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        deleteExtra()
        
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        
        
        
        vieww.observing3()
        myTable.observing3()
        linez.observing3()
        
        textBox.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged )
        
        
        textBox.delegate = self
      
        
     
        
        
        
        
       
        blocking()
        
    
       
    
        
        DataService.instance.user.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            guard let snapChat =  snap.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                var text = Texts()
                
               text.key = me.key
                
                if me.hasChild("email") {
                
                text.email = me.childSnapshot(forPath: "email").value as! String
                
                
                    if (self?.chat!.members!.contains(text.email))! {
                    
                    
                        self?.keyMembers2.append(me.key)
                    
                        self?.keyMembers.append(text)
                    
                    }
                    
                }
                
             
                
                
                
            }
        
            
            
            
            
        
          
            
            
        }
        
        
       
       
        DataService.instance.group.observe(  .childChanged , with: { (snapChat) in
            
            var snap = snapChat
            
            if snap.key == self.chat?.keyy {
                
                
         
                
                if snap.hasChild("write") {
                    
                  
                    
                    self.meme = snap.childSnapshot(forPath: "write").value as! Bool
                    
                    self.namez = snap.childSnapshot(forPath: "namez").value as! String
                    
                    
                    if self.meme == false {
                        
                        self.writing.text =  ""
                        
                        
                    }
                    
                    
                    
                    if self.meme == true {
                      
                        
                        var mems = self.namez.components(separatedBy: "@")
                        var ss = mems[0]
                        
                        if !self.userBlocked.contains(self.namez) {
                        
                        if Auth.auth().currentUser?.email != self.namez {
                            
                            self.writing.text = " \(ss) tyoing..."
                         
                            }
                            
                        }
                        
                      
                        
                        
                           
                            
                        
                        
                    }
                    
                    
                }
                
            }
            
            
            
            
            
        })
        
        textBox.layer.borderColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0).cgColor
        textBox.layer.borderWidth = 0.5
        
        
        textBox.layer.cornerRadius = 8
        
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["view" : "chat" ])
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).observe( .value , with : { (snapChat) in
            
            
            
            var me = snapChat
            self.numm = me.childSnapshot(forPath: "view").value as! String
            
        })
       
        
        self.time4 = 0
        
        
        
        
        groupImage.layer.borderWidth = 1
        groupImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
        
        
        
        if screenWidth == 375 {
            
            highting.constant = 35
            
        } else {
            
             highting.constant = 20
            
        }
        
        writing.text = ""
        
    
        
     picker.delegate = self
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).child("noti").observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
               var keys = me.key
                
                if me.childSnapshot(forPath: "new").value as? String == self.chat?.keyy {
                    
                   
                    
                    DataService.instance.user.child(Auth.auth().currentUser!.uid).child("noti").child(keys).child("new").removeValue()
                    
                    
                }
                
                
            }
        })
        
        
     
        
        
        
        
        if chat?.type == "p" {
            
            addMember.isHidden = true
            blockBTN.isHidden = true
            
        }
        
        
        
    
        
       
    
        DataService.instance.group.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            guard let snapChat = snap.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
            if me.key == self?.chat!.keyy {
                    
                    
                    var groupMembers = me.childSnapshot(forPath: "members").value as! NSArray
                    
                    
                    
                    self?.members = groupMembers as! [String]
                    self?.mem = groupMembers as! [String]
                    
                    
                    
                    
                    var boss = me.childSnapshot(forPath: "boss").value as! String
                    
                    if boss == Auth.auth().currentUser!.uid {
                        
                        
                        
                        self?.blockBTN.isHidden = true
                        self?.addMember.isHidden = false
                        
                        
                        
                    } else {
                        
                        self?.blockBTN.isHidden = false
                        self?.addMember.isHidden = true
                        
                        
                        
                    }
                    
                
                    
                    
                    
                    
                    
                    
                    
                    
                    
                   
                    
                    self?.name = me.childSnapshot(forPath: "name").value as! String
                    self?.name2 = me.childSnapshot(forPath: "name2").value as! String
                    
                    
                    if me.hasChild("image") {
                        
                        self?.image = me.childSnapshot(forPath: "image").value as? String
                        
                    }
                    
                    
                    if me.hasChild("image2") {
                        
                        self?.image2 = me.childSnapshot(forPath: "image2").value as! String
                        
                    }
                    
                    
                  
                    
                    
                    if self?.chat?.type == "p" {
                        
                        DataService.instance.user.observeSingleEvent(of: .value , with: { (snapChat) in
                            guard let snap = snapChat.children.allObjects as? [DataSnapshot] else {return}
                      
                            for me in snap {
                        
                                if self?.chat?.name == Auth.auth().currentUser?.email  {
                                    if self?.chat?.name2 == me.childSnapshot(forPath: "email").value as! String  {
                                
                                self?.ids = me.key
                              
                                        var ar = [self?.name , self?.name2 ]
                                
                            
                                        
                                        DataService.instance.group.child((self?.chat!.keyy)!).updateChildValues(["members" : ar ])
                                
                                
                                 
                                
                                
                              }
                            
                                }
                            
                        
                            
                        
                            }
                            
                            
                            
                            
                        })
                        
                        
                        DataService.instance.user.observeSingleEvent(of: .value , with: { (snapChat) in
                            guard let snap = snapChat.children.allObjects as? [DataSnapshot] else {return}
                            
                            for me in snap {
                                
                                if self?.chat?.name2 == Auth.auth().currentUser?.email  {
                                    if self?.chat?.name == me.childSnapshot(forPath: "email").value as! String  {
                                        
                                        self?.ids = me.key
                                    
                                        
                                    }
                                    
                                }
                                
                                
                                
                                
                            }
                            
                            
                            
                            
                        })
                        
                        
                        
                        
                        
                        Timer.scheduledTimer(withTimeInterval: 0.5 , repeats: false , block: { (timer) in
                       
                            if self?.ids != nil {
                        
                                DataService.instance.user.child((self?.ids!)!).observe( .value , with: { (snapChat) in
                            
                           
                          
                            var me = snapChat
                            
                            if me.hasChild("Online") {
                                
                                self?.lightz = me.childSnapshot(forPath: "Online").value as! String
                                
                                
                                if self?.lightz == "true" {
                                    
                                    self?.lights.text = "Online"
                                    
                                } else {
                                    
                                    
                                    self?.lights.text = ""
                                    
                                }
                                
                                
                            }
                            
                            
                        })
                                
                                
                            }
                        
                            
                        })
                    
                        
                        if self?.chat?.name == Auth.auth().currentUser?.email  {
                        
                        
                            var email = self?.chat?.name2.components(separatedBy: "@")
                        var meme = email![0]
                        
                            self?.emailGroup.text = meme
                        
                        
                        
                            if self?.image2 == "768646" {
                            
                            self?.groupImage.image = UIImage(named: "768646")
                            
                            
                        } else {
                            
                                self?.groupImage.sd_setImage(with: URL(string: (self?.image2!)!))
                            
                        }
                        
                        
                            
                            
                            
                    } else {
                        
                        
                            var email = self?.chat?.name.components(separatedBy: "@")
                        var meme = email![0]
                        
                            self?.emailGroup.text = meme
                        
                            if self?.image == "768646" {
                            
                            self?.groupImage.image = UIImage(named: "768646")
                            
                            
                        } else {
                            
                                self?.groupImage.sd_setImage(with: URL(string: (self?.image!)!))
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                        
                    }
                    
                    
                        
                    if self?.chat?.type == "g" {
                        
                        var email = self?.chat?.name.components(separatedBy: "@")
                        var meme = email![0]
                        
                        
                        
                        self?.emailGroup.text = meme
                        
                        if self?.image == "768646" {
                            
                            self?.groupImage.image = UIImage(named: "768646")
                            
                            
                        } else {
                            
                            self?.groupImage.sd_setImage(with: URL(string: (self?.image!)!))
                            
                        }
                    
                        
                    }
                    
                    
                    
                    
                }
                
               
                
                
            }
        }
        
        
        
    }
       

    
    @IBOutlet weak var blockBTN: UIButton!
    @IBAction func sendBTN(_ sender: Any) {
        
        if textBox.text != "" {
            
  
     
            
       
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
            formatter.amSymbol = "AM"
            formatter.pmSymbol = "PM"
            
            let dateString = formatter.string(from: Date())
            
            
            let currentTimeStamp = Date().toMillis()
          
            var emaaill = Auth.auth().currentUser!.email!.components(separatedBy: "@")
            
        
            var text = ["text" : textBox.text!  ,  "email" : Auth.auth().currentUser!.email , "image" : image  , "last" : "\(Auth.auth().currentUser!.email!) : \(textBox.text!)"  , "timme" : currentTimeStamp  ,  "time2" : dateString  , "boss" : chat?.boss , "uidd" : Auth.auth().currentUser!.uid  , "myImage" : "" ] as [String : Any]
        
      
            
            
            DataService.instance.group.child(chat!.keyy).child("messge").childByAutoId().updateChildValues(text)
            
            
            var mess = ["write" : false , "namez" : Auth.auth().currentUser!.email!] as [String : Any]
            
            DataService.instance.group.child(chat!.keyy).updateChildValues(mess)
             DataService.instance.group.child(self.chat!.keyy).updateChildValues(["last" : "\(emaaill[0]):\(textBox.text!)"])
         
            
            
            DataService.instance.group.child(chat!.keyy).updateChildValues(["timme" : currentTimeStamp])
            DataService.instance.group.child(chat!.keyy).updateChildValues(["time2" : dateString])
            
            var memee = ["new" : chat?.keyy , "namez" : Auth.auth().currentUser!.email ]
            
        
            textBox.text = ""
      
            for memea in self.keyMembers {
                
              
                    
                    if memea.key != Auth.auth().currentUser?.uid {
                        
                  
            
                         if !publicBlock.contains(memea.key) {
                            
                            if !userBlocked.contains(memea.email) {
                                
                    DataService.instance.user.child(memea.key).child("noti").childByAutoId().updateChildValues(memee)
             
                                
                                
                
                            }
                            
                            
                        }
                        
                    
                    
                }
                    
                
                
            }
            
        
        
    
        }
        
        
        
    }
    
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         myTable.deselectRow(at: indexPath, animated: true)
        var me = messge[indexPath.row]
        
       
            if me.myImage != "" {
        
            
            self.performSegue(withIdentifier: "ethan", sender: me.myImage)
                
            }
        
    }
    
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        
          var me = messge[indexPath.row]
        
        let closeAction = UIContextualAction(style: .normal, title:  "Profile", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            self.performSegue(withIdentifier: "block", sender: me)
            
            
            
            success(true)
        })
        closeAction.image = UIImage(named: "tick")
        closeAction.backgroundColor = .purple
        
        return UISwipeActionsConfiguration(actions: [closeAction])
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "block" {
        
        
        var firstVC = segue.destination as! proFileViewController
        firstVC.user = sender as? Texts
        
        }
        
        
        if segue.identifier == "mess" {
            
            
            var firstVC = segue.destination as! addNewViewController
            firstVC.keys2 = sender as? String
            firstVC.users22 = members as! [String]
            firstVC.bigG = chat as? Group
            
        }
        
        //
        
        
        
        if segue.identifier == "addNew" {
            
            
            var firstVC = segue.destination as! addNewViewController
            firstVC.keys = sender as? String
            firstVC.users22 = members as! [String]
            
        }
        
        if segue.identifier == "ethan" {
            
            var firstVC = segue.destination as! proFileViewController
            firstVC.userr = sender as? String
            
            
        }
        
        
        
    }
    
 
  
    
    var tim : Timer!
    
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        tim?.invalidate()
        tim = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(textFieldStopEditing), userInfo: nil, repeats: false)
        
        var mess = ["write" : true , "namez" : Auth.auth().currentUser!.email!] as [String : Any]
        
         DataService.instance.group.child(chat!.keyy).updateChildValues(mess)
        
        
    }
    
    @objc func textFieldStopEditing(sender: Timer) {
        
        
        var mess = ["write" : false , "namez" : Auth.auth().currentUser!.email! ] as [String : Any]
    
         DataService.instance.group.child(chat!.keyy).updateChildValues(mess)
        
    }
    
    
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        messge = [Texts]()
        
        
        Timer.scheduledTimer(withTimeInterval: 0.5 , repeats: false ) { (time) in
        
        DataService.instance.group.child(self.chat!.keyy).child("messge").queryLimited(toLast: 30).observe( .childAdded , with: { (snapChat) in
            
            Timer.scheduledTimer(withTimeInterval: 0.5 , repeats: false ) { (time) in
                
                
                
                
                var snap = snapChat
                
                var chatt = Texts()
                
                
                
                
                if snap.hasChild("uidd") {
                    
                    chatt.uidd = snap.childSnapshot(forPath: "uidd").value as! String
                    
                }
                
                
                if snap.hasChild("boss") {
                    chatt.boss = snap.childSnapshot(forPath: "boss").value as! String
                    
                }
                
                
                chatt.text  = snap.childSnapshot(forPath: "text").value as! String
                chatt.email = snap.childSnapshot(forPath: "email").value as! String
                chatt.myImage = snap.childSnapshot(forPath: "myImage").value as! String
                
                
                if snap.hasChild("image") {
                    
                    chatt.image = snap.childSnapshot(forPath: "image").value as! String
                    
                }
                
                chatt.time = snap.childSnapshot(forPath: "timme").value as! Double
                chatt.time2 = snap.childSnapshot(forPath: "time2").value as! String
                chatt.uid = snap.key
                
                
                
                if !self.userBlocked.contains(chatt.email) {
                    
                    
                    self.messge.append(chatt)
                    
                       self.myTable.reloadData()
                    
                    
                    self.updateTableContentInset()
                    
                 
                    
                    if self.messge.count > 0 {
                        self.myTable.scrollToRow(at: IndexPath.init(row: self.messge.count - 1 , section: 0)  , at: .none , animated: false )
                        
                        
                    }
                }
                
            }
            
            
        })
        
        
        
        
        }
        
        
        
        
        
     
    }
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        UIView.animate(withDuration: 0.1) {
         
            
            self.view.endEditing(true)
            
          
            
        }
        
        
        return true
    }
    

    
    
    
    @IBAction func blockBTN(_ sender: Any) {
        
        var alart = UIAlertController(title: "", message: "Do you want to leave the chat ?", preferredStyle: .alert  )
        var action1 = UIAlertAction(title: "out", style: .default) { (action) in
            
            self.showMe(show: true)
            
            self.sendBTN.isEnabled = false
            self.backButton.isEnabled = false
            
            var meme = Auth.auth().currentUser!.email
            
            
            if self.oldUID.contains(self.chat!.keyy) {
                
                self.oldUID = self.oldUID.filter({ $0 != self.chat!.keyy })
                
                DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["groups" : self.oldUID])
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
            if self.members.contains(meme!) {
                
                
                self.self.members = self.members.filter({ $0 != meme  })
                
                
                
    
                
              
                DataService.instance.group.child(self.chat!.keyy).updateChildValues([ "left" : meme ])
                
                DataService.instance.group.child(self.self.chat!.keyy).updateChildValues(["members" : self.members ])
                
                if self.members.count == 0 {
                    
                
                    DataService.instance.group.child(self.chat!.keyy).removeValue()
                    
                }
                
                
                
                Timer.scheduledTimer(withTimeInterval: 3 , repeats: false, block: { (timer) in
                    
                    
                    
                    
                    self.showMe(show: false)
                    
                    
                    var story = self.storyboard?.instantiateViewController(withIdentifier: "firstVC")
                    self.present(story!, animated: true, completion: nil)
                    
                    
                    
                })
            }
            
            
            
            
        }
        
        
        var action2 = UIAlertAction(title: "cancel", style: .default) { (action) in
            self.view.endEditing(true)
        }
        
   
        alart.addAction(action1)
        alart.addAction(action2)
        
        present(alart, animated: true, completion: nil)
        
        
        
    }
    
    
    func updateTableContentInset() {
        let numRows = tableView(self.myTable, numberOfRowsInSection: 0)
        var contentInsetTop = self.myTable.bounds.size.height
        for i in 0..<numRows {
            let rowRect = self.myTable.rectForRow(at: IndexPath(item: i, section: 0))
            
            contentInsetTop -= rowRect.size.height
            
            
            if contentInsetTop <= 0 {
                contentInsetTop = 0
            }
        }
        
        self.myTable.contentInset = UIEdgeInsetsMake(contentInsetTop, 0, 0, 0 )
        
    }

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textBox.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 100
    }
    
    
    @IBOutlet weak var addMember: UIButton!
    @IBAction func addMember(_ sender: Any) {
        
        
        performSegue(withIdentifier: "addNew", sender: chat?.keyy)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
           var memee = messge[indexPath.row]
        
        
        
        if editingStyle == .delete {
            
            messge.remove(at: indexPath.row) //langData is array from i delete values
            myTable.deleteRows(at: [indexPath],  with: .fade )
                
            }
            
            
            
            
            
            DataService.instance.group.child(chat!.keyy).child("messge").observeSingleEvent(of: .value , with: { (snapChat) in
                guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
                for me in snapChat {
                    
                  
                    if me.childSnapshot(forPath: "email").value as! String! == memee.email {
                   
                        if memee.email == Auth.auth().currentUser!.email {
                
                             if memee.text == me.childSnapshot(forPath: "text").value as! String! {
                                
                                var keyy = me.key
                            
                                    
                                DataService.instance.group.child(self.chat!.keyy).child("messge").child(keyy).removeValue()
                                    
                                   
                            
                                
                            
                              
                            }
                        
                    
                    }
                    
              self.myTable.reloadData()
              self.updateTableContentInset()
          
                    
             
                    
                    
                    
                    }
                    
                    
                    
                    
                }
                
                
            })
            
            
            
    }
        

}

extension Date {
    func toMillis() -> Double! {
        return Double(self.timeIntervalSince1970 * 1000)
    }
}
