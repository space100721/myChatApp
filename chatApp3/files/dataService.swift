//
//  dataService.swift
//  chatApp3
//
//  Created by Apple on 2/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import Firebase
import UIKit
var dataService = Database.database().reference()
class DataService {
    
    static var instance = DataService()
    
    private var data_ = dataService
    private var user_ = dataService.child("users")
    private var texts_ = dataService.child("texts")
    private var group_ = dataService.child("groups")
    
    private let reportt = dataService.child("report")
    
    private let write_ = dataService.child("write")
    
    
    
    
    
    var write : DatabaseReference {
        return write_
    }
    
    
    
    
    
    
    
    var report : DatabaseReference {
        return reportt
    }
    
    
    var data : DatabaseReference {
        
        return data_
        
    }
    
    var user : DatabaseReference {
        
        return user_
        
    }
    
    var text : DatabaseReference {
        
        return texts_
        
    }
    
    var group : DatabaseReference {
        
        return group_
        
    }
    
    
    
    
    var userNoti : [String] = []
    
    
    func notifiing () {
        
     
            
            self.userNoti = [String]()
            
            DataService.instance.user.child(Auth.auth().currentUser!.uid).child("noti").observeSingleEvent(of: .value , with: { (snapChatt) in
                
                guard let snapp = snapChatt.children.allObjects as? [DataSnapshot] else {return}
                for me in snapp {
                
                    if me.hasChild("namez") {
                    
                        var name = me.childSnapshot(forPath: "namez").value as! String
                        
                        if !self.userBlocked.contains(name) {
                   
                    if me.hasChild("new") {
                        
                        var notti = me.childSnapshot(forPath: "new").value as! String
                        
                        self.userNoti.append(notti)
                        
                    } else {
                        
                        DataService.instance.user.child(Auth.auth().currentUser!.uid).child("noti").child(me.key).removeValue()
                        
                        
                        
                    }
                            
                        } else {
                            
                            DataService.instance.user.child(Auth.auth().currentUser!.uid).child("noti").child(me.key).removeValue()
                            
                            
                        }
                    
                        
                    } else {
                        
                          DataService.instance.user.child(Auth.auth().currentUser!.uid).child("noti").child(me.key).removeValue()
                        
                        
                    }
                    
                    
                }
                
            
            
            
        })
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    var publicBlock : [String] = []
    
    
    func publicB () {
        
        DataService.instance.user.observe(.value , with : { (snapChat) in
            
            
            
            DataService.instance.user.observeSingleEvent(of: .value , with: { (snapChatt) in
                
                guard let snapp = snapChatt.children.allObjects as? [DataSnapshot] else {return}
                for me in snapp {
                    
                    var key = me.key
                    
                    if me.key != Auth.auth().currentUser!.uid {
                        
                        if me.hasChild("block") {
                    
                    var kk  = me.childSnapshot(forPath: "block").value as? NSArray as! [String]
                    
                    if kk.contains(Auth.auth().currentUser!.email!) {
                        
                        self.publicBlock.append(me.key)
                        
                        print(me.key)
                        
                    }
                            
                        }
                    }
                    
                }
                
            })
            
            
        })
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var ids : [String] = []
    
    var userBlocked : [String] = []
    
    
    func blocking () {
        
        DataService.instance.user.observe(.value , with : { (snapChat) in
            
      
            
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
       
            
        })
        
        
        
        
    }
   
 
    func blocking2 () {
        
        DataService.instance.user.observe(.value , with : { (snapChat) in
            
            
            
            DataService.instance.user.observeSingleEvent(of: .value , with: { (snapChatt) in
                
                guard let snapp = snapChatt.children.allObjects as? [DataSnapshot] else {return}
                for me in snapp {
                    
                    if me.key == Auth.auth().currentUser?.uid {
                        
                       
                        self.userBlocked = [String]()
                        
                    }
                    
                    
                }
                
            })
            
            
        })
        
        
        
        
    }

    
    var blocks : [String] = []
    
    var myName = ""
        
        
        
    func downloadGroup (handle : @escaping (_  groupArray : [Group]) -> ()) {
        
       
        
        var myGroup : [Group] = []
        
        DataService.instance.group.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            
      
       
            self?.blocking()
    
        
            
            guard let snapChatt = snap.children.allObjects as? [DataSnapshot] else {return}
            for snap in snapChatt{
                var group = Group()
                
                group.keyy = snap.key
                group.name = snap.childSnapshot(forPath: "name").value as! String
                group.type = snap.childSnapshot(forPath: "type").value as! String
                group.members = snap.childSnapshot(forPath: "members").value as! NSArray
                group.texts = snap.childSnapshot(forPath: "last").value as! String
                group.time = snap.childSnapshot(forPath: "timme").value as! Double
                 group.time2 = snap.childSnapshot(forPath: "time2").value as! String
                group.boss = snap.childSnapshot(forPath: "boss").value as! String
                
                if snap.hasChild("namez") {
                
                group.namez = snap.childSnapshot(forPath: "namez").value as! String
                    
                }
                
              
                
                
                if snap.hasChild("write") {
                    
                    group.write = snap.childSnapshot(forPath: "write").value as? Bool
                }
                
            
                
                if (self?.userNoti.contains(snap.key))! {
                    
                    if  snap.hasChild("noti") {
                    
                    group.noti = snap.childSnapshot(forPath: "noti").value as! Bool
                        
                    }
                    
                } else {
                    
                    group.noti = false
                }
                
                
                group.name2 = snap.childSnapshot(forPath: "name2").value as! String
                
                if snap.hasChild("image2") {
                
                group.image2 = snap.childSnapshot(forPath: "image2").value as! String
                    
                }
                
                
                if snap.hasChild("image") {
                    
                      group.image = snap.childSnapshot(forPath: "image").value as! String
                    
                }
                
             
                
                
                if group.members!.contains(Auth.auth().currentUser!.email) {
                    
                
                
                    if group.type == "p" {
                        
                        if Auth.auth().currentUser?.email == group.name {
                            
                            print("6666")
                            
                            self?.myName = group.name2
                            
                        } else {
                            
                            
                            self?.myName = group.name
                            
                            
                        }
                       
                        
                        
                        if !(self?.userBlocked.contains((self?.myName)!))! {
                
                
                        myGroup.append(group)
             
                        
                    }
                        
                        
                    } else if group.type == "g" {
                        
                        myGroup.append(group)
                        
                    }
                    
                    
                    myGroup.sort(by: { (m1,  m2) -> Bool in
                        
                        return m1.time > m2.time
                        
                        
                    })
                    
            
                }
                
                
                
            }
            
        
            
            handle(myGroup)
        }
        
    }
    
    
    func meUp() {
        
        
        
        
        
        
    }
    
    
    
    func getGroup2 ( search : String , handler : @escaping (_ userss : [Group]) -> () ) {
        
        var users : [Group] = []
        
        DataService.instance.group.observeSingleEvent(of: .value) { [weak self] (snap: DataSnapshot!) in
            guard let snap = snap.children.allObjects as? [DataSnapshot] else {return}
            for snap in snap {
                
                var group = Group()
                
                
                group.keyy = snap.key
                group.name = snap.childSnapshot(forPath: "name").value as! String
                group.type = snap.childSnapshot(forPath: "type").value as! String
                group.members = snap.childSnapshot(forPath: "members").value as! NSArray
                group.texts = snap.childSnapshot(forPath: "last").value as! String
                group.time = snap.childSnapshot(forPath: "timme").value as! Double
                group.time2 = snap.childSnapshot(forPath: "time2").value as! String
                group.boss = snap.childSnapshot(forPath: "boss").value as! String
                
                if snap.hasChild("image") {
                    
                    group.image = snap.childSnapshot(forPath: "image").value as! String
                    
                }
                
                
                if !group.members!.contains(Auth.auth().currentUser!.email) && group.type == "g" && group.name.contains(search)    {
                    
                    users.append(group)
                    
                }
                
                
            }
            
            handler(users)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    func getUser ( search : String , handler : @escaping (_ users : [Texts]) -> () ) {
        
        var users : [Texts] = []
        
        DataService.instance.user.observeSingleEvent(of: .value  , with:  { (snapChat) in
            guard let snapChatt = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for snap in snapChatt {
                
                var me = Texts()
                
                if snap.hasChild("email") {
               
                me.email = snap.childSnapshot(forPath: "email").value as! String
                    
                }
                
                  if snap.hasChild("image") {
                
                
                me.image = snap.childSnapshot(forPath: "image").value as! String
                    
                }
                
                if me.email.contains(search) && me.email != Auth.auth().currentUser!.email  {
                
                users.append(me)
                
                }
                
                
            }
            
                handler(users)
            
        })
        
    
        
    }
    
    
    
}
