//
//  chat21ViewController.swift
//  chatApp3
//
//  Created by Apple on 5/12/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

class chat21ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UITextFieldDelegate {

    
    var chat : Group?
    var messge : [Texts] = []
    
    var userBlocked : [String] = []
    var publicBlock : [String] = []
    var keyMembers : [Texts] = []
    var keyMembers2 : [String] = []
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "21"
        
        return cell
        
        
    }
    

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var vieww: UIView!
    @IBOutlet weak var textBox: UITextField!


    @IBAction func sendBTN(_ sender: Any) {
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        self.view.endEditing(true)
        
    }
    
    
    func blocking () {
        
        
        
        self.userBlocked = [String]()
        
        DataService.instance.user.observeSingleEvent(of: .value , with: { (snapChatt) in
            
            guard let snapp = snapChatt.children.allObjects as? [DataSnapshot] else {return}
            for me in snapp {
                
                if me.key == Auth.auth().currentUser?.uid {
                    
                    if me.hasChild("block") {
                        
                        self.userBlocked = me.childSnapshot(forPath: "block").value as! NSArray as! [String]
                        
                        
                    }
                    
                }
                
                
            }
            
        })
        
        
        self.publicBlock = [String]()
        
        DataService.instance.user.observeSingleEvent(of: .value , with: { (snapChatt) in
            
            guard let snapp = snapChatt.children.allObjects as? [DataSnapshot] else {return}
            for me in snapp {
                
                var key = me.key
                
                if me.key != Auth.auth().currentUser!.uid {
                    
                    if me.hasChild("block") {
                        
                        var kk  = me.childSnapshot(forPath: "block").value as? NSArray as! [String]
                        
                        
                        
                        
                        if kk.contains(Auth.auth().currentUser!.email!) {
                            
                            self.publicBlock.append(me.key)
                            
                            print("444443\(me.key)")
                            
                        }
                        
                    }
                    
                }
            }
            
            
            
            
        })
        
        
        
        
        
        
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        blocking()
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat =  snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                var text = Texts()
                
                text.key = me.key
                
                if me.hasChild("email") {
                    
                    text.email = me.childSnapshot(forPath: "email").value as! String
                    
                    
                    if self.chat!.members!.contains(text.email) {
                        
                        
                        self.keyMembers2.append(me.key)
                        
                        self.keyMembers.append(text)
                        
                    }
                    
                }
                
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
        })
        
        
        
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
                    
                    
                    
                    self.updateTableContentInset()
                    
                    
                    self.myTable.reloadData()
                    
                    
                    
                }
                
                
                
                
            }
            
            
        })
        
        
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        UIView.animate(withDuration: 0.1) {
            
            
            
            
            
            self.view.endEditing(true)
            
            
            
            
            
            
        }
        
        
        return true
    }
    
    
    
    
    
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBox.delegate = self
        
        vieww.observing3()
       
        myTable.observing3()
        line.observing3()
        
        
        
        DataService.instance.group.child(self.chat!.keyy).child("messge").queryLimited(toLast: 30).observe( .childAdded , with: { (snapChat) in
            
            Timer.scheduledTimer(withTimeInterval: 0.5 , repeats: false ) { (time) in
                
                
                
                guard let snapChatt = snapChat.children.allObjects as? [DataSnapshot] else {return}
                var snap = snapChat
                
                var chatt = Texts()
                
                
                
                
                if snap.hasChild("uidd") {
                    
                    chatt.uidd = snap.childSnapshot(forPath: "uidd").value as! String
                    
                }
                
                chatt.boss = snap.childSnapshot(forPath: "boss").value as! String
                
                
                
                
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
                    
                    var ss = chatt.email.components(separatedBy: "@")
                    
                    
                    
                    self.messge.append(chatt)
                    
                }
                
                
                
                self.myTable.reloadData()
                
                
                
                self.updateTableContentInset()
                
                
                
                
                
                
                
                
                
                
                
                
                if self.messge.count > 0 {
                    self.myTable.scrollToRow(at: IndexPath.init(row: self.messge.count - 1 , section: 0)  , at: .none , animated: false )
                }
                
            }
            
            
        })
        
        
     
        
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

   


}
