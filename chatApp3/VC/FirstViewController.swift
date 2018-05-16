//
//  FirstViewController.swift
//  chatApp3
//
//  Created by Apple on 2/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage


import AudioToolbox



import AVFoundation

class FirstViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate   {
    
    @IBOutlet weak var writing: UILabel!
    @IBOutlet weak var myyHight: NSLayoutConstraint!
    
    var time4 = 0
    
    var timer2 = 0
    var timer3 = 0
    
    var audioPlayer = AVAudioPlayer()
    
   
    
 
    var image : String?
    
    var emails : [String] = []
    
    var change : Bool?
    
    var timer = 0
    
     var timerr = 0
    var groups : [Group] = []
    
    @IBOutlet weak var vieww: UIView!
    @IBOutlet weak var textBox: textBox!
    
    @IBOutlet weak var buttonSend: UIButton!
    
    func deleteExtra() {
        
        DataService.instance.text.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat =  snapChat.children.allObjects as? [DataSnapshot] else {return}
            
            for me in snapChat {
                
                
                
                
                var meh = me.key
                
                self.gg.append(meh)
                
                if self.gg.count >= 30 {
                    
                    DataService.instance.text.queryLimited(toFirst : 10).observeSingleEvent(of: .value , with : { (snapChatta) in
                        
                        guard let snapChat2 =  snapChatta.children.allObjects as? [DataSnapshot] else {return}
                        
                        for me in snapChat2 {
                            
                            
                            print("heyyyyyah")
                            
                            DataService.instance.text.child(me.key).removeValue()
                            
                        }
                        
                        
                        
                        
                    })
                    
                    
                    
                    
                    
                    
                    
                }
                
                
            }
            
            
            
            
        })
        
        
    }
    
    
    func getmessge () {
        
        
        
        self.texting = [Texts]()
        
        
        DataService.instance.text.queryLimited(toLast: 50).observe( .childAdded , with: { (snapChat) in
            
            
            self.timer3 += 1
            
            
            
            
            guard let snapChatt = snapChat.children.allObjects as? [DataSnapshot] else {return}
            weak var snap = snapChat
            
            var myText = Texts()
            
            myText.email = snap?.childSnapshot(forPath: "email").value as! String
            myText.text = snap?.childSnapshot(forPath: "text").value as! String
            
            myText.time2 = snap?.childSnapshot(forPath: "timing").value as! String
            
            
            if snap!.hasChild("image") {
                
                
                myText.image = snap?.childSnapshot(forPath: "image").value as! String
                
            }
            
            
            
            if !self.userBlocked.contains(myText.email) {
                
                
                
                
                self.texting.append(myText)
                
            
            
            
            
            self.myTable.reloadData()
            
            
            
            
            
            
            if self.texting.count > 0 {
                self.myTable.scrollToRow(at: IndexPath.init(row: self.texting.count - 1 , section: 0)  , at: .none , animated: false )
            }
            
            }
            
            
        })
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func buttonSend(_ sender: Any) {
        

   
            
            if textBox.text != "" {
                
                
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
                formatter.amSymbol = "AM"
                formatter.pmSymbol = "PM"
                
                let dateString = formatter.string(from: Date())
                
                
                
                var text = ["email" : Auth.auth().currentUser!.email , "text" : textBox.text , "image" : image , "timing" : dateString ] as [String : Any]
                
                
                var mess = ["write" : false , "namez" : Auth.auth().currentUser!.email! ] as [String : Any]
                
                DataService.instance.write.child("write").updateChildValues(mess)
                
                
                
                
                DataService.instance.text.childByAutoId().updateChildValues(text)
               
                textBox.text = ""
    
   
            }
                
        
        
        
    }
    
  
    
    var tim : Timer!
    
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        tim?.invalidate()
        tim = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(textFieldStopEditing), userInfo: nil, repeats: false)
        
        var mess = ["write" : true , "namez" : Auth.auth().currentUser!.email!] as [String : Any]
        
         DataService.instance.write.child("write").updateChildValues(mess)
        
        
    }
    
    @objc func textFieldStopEditing(sender: Timer) {
        
        
        var mess = ["write" : false , "namez" : Auth.auth().currentUser!.email! ] as [String : Any]
        
        DataService.instance.write.child("write").updateChildValues(mess)
        
    }
    
    
    
    
    
    @IBAction func addText(_ sender: Any) {
        
        
        performSegue(withIdentifier: "writeText", sender: nil)
        
    }
    var blocked : [String] = []
    var texting : [Texts] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return texting.count
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
       
        
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath ) as!  textTableViewCell
        
        let cell2 = myTable.dequeueReusableCell(withIdentifier: "privetCell", for: indexPath ) as!  secondTableViewCell
        
        var text = texting[indexPath.row]
        var email = text.email.components(separatedBy: "@")
        
        
        if text.email == Auth.auth().currentUser?.email {
            
            
            let uni = text.text.unicodeScalars // Unicode scalar values of the string
            let unicode = uni[uni.startIndex].value
            
        var time = text.time2.components(separatedBy: "on")
            
          cell2.stamp.text = time[0]
            
            cell2.textingLabel.text = text.text
            
            
            
          
                
                
            
            
            
            
            return cell2
            
            
        }
        
        
        
        cell.emailLabel.text = email[0]
        
        
        
        
        cell.textingLabel.text = text.text
        var time = text.time2.components(separatedBy: "on")
        cell.stamp.text = time[0]
        
        
   
        let uni = text.text.unicodeScalars // Unicode scalar values of the string
        let unicode = uni[uni.startIndex].value
        
        
        
        if text.image == "768646" {
            
            cell.myImage.image = UIImage(named: "768646")
            
        } else {
            
             cell.myImage.sd_setImage(with: URL(string: text.image))
            
        }
        
        return cell
     
        
    }
    
    var meme : Bool?
    var namez = ""
    
    
    
    @IBOutlet weak var myTable: UITableView!
    
    
    var userBlocked : [String] = []
 
    
    
    func blocking () {
        
        
        
        self.userBlocked = [String]()
        
        DataService.instance.user.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            
            guard let snapp = snap.children.allObjects as? [DataSnapshot] else {return}
            for me in snapp {
                
                if me.key == Auth.auth().currentUser?.uid {
                    
                    if me.hasChild("block") {
                        
                        self?.userBlocked = me.childSnapshot(forPath: "block").value as! NSArray as! [String]
                        
                        
                    }
                    
                }
                
                
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        getmessge()
        
        
        
        if Auth.auth().currentUser?.email != nil {
            
            DataService.instance.user.child(Auth.auth().currentUser!.uid).observe( .value , with : { (snapChat) in
                
                var me = snapChat
                
                if me.hasChild("noti") {
                    
                    self.tabBarController?.tabBar.items![1].image = UIImage(named: "handle2")
                    // items![0] index of your tab bar item.items![0] means tabbar first item
                    
                    self.tabBarController?.tabBar.items![1].selectedImage = UIImage(named: "handle2")
                    
                    
                    self.tabBarController?.tabBar.items![1].setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0)], for: .normal)
                    self.tabBarController?.tabBar.items![1].setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0)], for: .selected)
                    
                    self.tabBarController?.tabBar.items![1].image = UIImage(named: "handle2")?.withRenderingMode(.alwaysOriginal)
                    
                    
                    self.tabBarController?.tabBar.items![1].title = "new"
                   
                } else {
                    
                    self.tabBarController?.tabBar.items![1].image = UIImage(named: "groups-tabIcon")
                    // items![0] index of your tab bar item.items![0] means tabbar first item
                    
                    self.tabBarController?.tabBar.items![1].selectedImage = UIImage(named: "groups-tabIcon")
                    
                    
                    self.tabBarController?.tabBar.items![1].setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.gray], for: .normal)
                    
                    
                    self.tabBarController?.tabBar.items![1].setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0)] , for: .selected)
                    
                    
                    self.tabBarController?.tabBar.items![1].title = "Group"
                 
                }
                
                
                
                
                
                
                
            })
        
            
        }
        
        DataService.instance.write.observe(  .childChanged , with: { (snapChat) in
            
            weak var snap = snapChat
            
           
            if snap!.hasChild("write") {
                
               
                    
                self.meme = snap?.childSnapshot(forPath: "write").value as! Bool
                
            
                
            
                self.namez = snap?.childSnapshot(forPath: "namez").value as! String
                
            
                    
                    if self.meme == true {
                        
                        
                        if Auth.auth().currentUser!.email !=  self.namez {
                        
                        
                     
                        
                        var mems = self.namez.components(separatedBy: "@")
                        var ss = mems[0]
                            
                            if !self.userBlocked.contains(self.namez) {
                        
                        self.writing.text = " \(ss) typing..."
                     
                            }
                        
                    } else {
                        
                        self.writing.text = ""
                        
                    }
                }
               
            
            }
            
        })
        
        
        
        
        
        
        
         textBox.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged )
        
        
        
        if Auth.auth().currentUser?.uid != nil {
            
          let ref = DataService.instance.user.child(Auth.auth().currentUser!.uid).child("Online").setValue("true")
            
        }
    
        
        textBox.delegate = self
        
        
   
     
       configureTableView()
        
        
        
    }
    
    
    
  
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textBox.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 100
    }
    
    
 
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
       
        
        if timer < 1 {
            
            
        
            timer += 1
            
            
    
          
            
        
          view.observing3()
            
            
            if screenWidth == 375 {
                
                if screenHight ==  812 {
                    
                    view.frame.origin.y += 80
                } else {
                    
                     view.frame.origin.y += 50
                    
                }
                
                
                
                
                
            } else {
        
        
            view.frame.origin.y += 50

            }
            
            
        } else {
            
            if screenWidth == 375 {
                
                if screenHight ==  812 {
                    
                    view.frame.origin.y += 80
                } else {
                    
                    view.frame.origin.y += 50
                    
                }
                
                
            } else {
            
            
            view.frame.origin.y += 50
                
                
            }
        }
        
        
    }
    
    
    
   var timee = 3
    
    

    
    var num = ""
    
    var idd = ""
   var ids = [String]()
    
    func getStuffDone () {
        
        
        
        if let meme = Auth.auth().currentUser?.uid {
            
            DataService.instance.user.child(meme).child("noti").observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
                
                guard let snapChat = snap.children.allObjects as? [DataSnapshot] else {return}
                for me in snapChat {
                    
                     if !me.hasChild("new") {
                        
                        
                     } else {
                        
                        
                          DataService.instance.user.child(meme).child("noti").child(me.key).removeValue()
                        
                    }
                    
                    
                    if me.hasChild("name") {
                        
                     
                        
                        
                        
           
                        self?.idd = me.childSnapshot(forPath: "name").value as! String
                        
                        
                  
                            
                            DataService.instance.user.child(meme).child("noti").child(me.key).removeValue()
                            
                            
                       
                            
                    }
                }
            }
            
        }
    }
    
    
    
    var blocks : [String] = []
    
    var myName = ""
    
    
 
    var gg : [String] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        blocking()
        
        
        deleteExtra()
        
     
        textBox.layer.borderColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0).cgColor
        textBox.layer.borderWidth = 0.5
        
        
        textBox.layer.cornerRadius = 8
       
        if Auth.auth().currentUser?.email != nil {
        
    
        DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["view" : "first" ])
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).observe( .value , with : { (snapChat) in
            var me = snapChat
            self.num = me.childSnapshot(forPath: "view").value as! String
            
        })
        
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
     
     
        
        self.time4 = 0
      
        
        timer2 = 0
        timer3 = 0
        
     writing.text = ""
  
  
        Timer.scheduledTimer(withTimeInterval: 1 , repeats: false ) { (timer) in
     
        
            
        DataService.instance.user.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            guard let snapChat = snap.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                 weak var mee = Texts()
                if me.key == Auth.auth().currentUser!.uid {
                    
                    
                    if me.hasChild("email") {
                        
                        
                        
                    } else {
                        
                        mee?.key = me.key
                        
                        
                        
                        if Auth.auth().currentUser?.uid == mee?.key {
                            
                            self?.showMe(show: true)
                            
                            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
                                
                                do {
                                    
                                    
                                    try Auth.auth().signOut()
                                    
                                    self?.performSegue(withIdentifier: "gettf", sender: nil)
                                    
                                    
                                    
                                    self?.showMe(show: false)
                                    
                                    
                                } catch {
                                    
                                    
                                }
                                
                            })
                            
                            
                            
                        }
                        
                    }
                    
                 
                    
                    self?.image = me.childSnapshot(forPath: "image").value as? String
                    
                   
                 
                    
                }
                
            }
        }
            
        }
  
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        UIView.animate(withDuration: 0.1) {
        
        self.view.endEditing(true)
        
            UIView.animate(withDuration: 0.2, animations: {
         
     
                if self.screenWidth == 375 {
                    
                    if self.screenHight ==  812 {
                        
                        self.view.frame.origin.y  -= 80
                    } else {
                        
                        self.view.frame.origin.y -= 50
                        
                    }
                    
                } else {
                    
                    
                      self.view.frame.origin.y -= 50
                    
                }
                    
                
                
         
            
            })
            
        }
       
        
        return true
    }
    
    
    func configureTableView() {
        myTable.rowHeight = UITableViewAutomaticDimension
        myTable.estimatedRowHeight = 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myTable.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    
    
    
    
    
    
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        
        var me = texting[indexPath.row]
        
        let closeAction = UIContextualAction(style: .normal, title:  "Profile", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            self.performSegue(withIdentifier: "block2", sender: me)
            
            
            
            success(true)
        })
        closeAction.image = UIImage(named: "tick")
        closeAction.backgroundColor = .purple
        
        return UISwipeActionsConfiguration(actions: [closeAction])
        
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "block2" {
        var firstVC  = segue.destination as! userProfile2ViewController
        firstVC.user = sender as? Texts
       }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        var memee = texting[indexPath.row]
        
        
        
        
        if editingStyle == .delete {
            
            
            
            
            if memee.email == Auth.auth().currentUser?.email {
                
                
               texting.remove(at: indexPath.row) //langData is array from i delete values
                myTable.deleteRows(at: [indexPath],  with: .fade )
            }
            
            
            
            Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { (timer) in
                
                
                
                if memee.email == Auth.auth().currentUser!.email {
                    
                    DataService.instance.text.observeSingleEvent(of: .value , with: { (snapChat) in
                        
                        guard let snapChatt = snapChat.children.allObjects as? [DataSnapshot] else {return}
                        
                        for me in snapChatt {
                            
                            
                            
                            if me.childSnapshot(forPath: "text").value as! String == memee.text {
                                
                                var mess = me.key
                                
                                
                                DataService.instance.text.child(mess).removeValue()
                                
                            }
                            
                        }
                        
                    })
                    
                }
                
                
                
            }
            
         
            
        }
  
    
}
 
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
      
    }

    public var screenHight : CGFloat {
        return UIScreen.main.bounds.height
        
    }
    
    


}

