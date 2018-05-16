//
//  ViewControllersearchGroup.swift
//  chatApp3
//
//  Created by Apple on 4/24/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import AudioToolbox
import Firebase

import AVFoundation

class ViewControllersearchGroup: UIViewController , UITableViewDelegate , UITableViewDataSource  , UITextFieldDelegate {
    
    var timer2 = 0
    
    var chosenGroups : [Group] = []
    
     var groups : [Group] = []
    
    var timerr = 0
    var time4 = 0
    
        var audioPlayer = AVAudioPlayer()
    
  
    @IBOutlet weak var textBox: textBox!
    
    
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chosenGroups.count
        
      
        
    }
    
   
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "samoly", for: indexPath) as! TableViewCellgroupz
        
        
        var me = chosenGroups[indexPath.row]
          cell.groupName?.text = me.name
        cell.memNumbers.text = "\(me.members!.count) Members"
   
        if me.image == "768646" {
            
            cell.myImage?.image = UIImage(named: "768646")
            
        } else {
            
            cell.myImage?.sd_setImage(with: URL(string: me.image))
            
        }
        
        if me.members!.count >= 49 {
            cell.vieww.backgroundColor = UIColor.red
        }
        
        
        
        return cell
        
        
        
    }
    
  
    var ss : [String] = []
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
           myTable.deselectRow(at: indexPath, animated: true)
        
        var me = chosenGroups[indexPath.row]
        
        if me.members!.count <= 49 {
        
        var alarting = UIAlertController(title: "" , message: "Do you want to join \(me.name) ", preferredStyle: .alert )
        
        var actionAlart = UIAlertAction(title: "Join", style:  .default) { (action) in
            
            
            self.ss = me.members as! [String]
            self.ss.append(Auth.auth().currentUser!.email!)
            
            DataService.instance.group.child(me.keyy).updateChildValues(["members" :  self.ss ])
            
            self.showMe(show: true)
            
            self.view.endEditing(true)
            
            Timer.scheduledTimer(withTimeInterval: 4 , repeats: false) { (timer) in
                
                self.showMe(show: false)
                
            
                    
                    self.performSegue(withIdentifier: "newGG", sender: me)
                    
                
            }
            
            
            
            
            
        }
   
        var action2 = UIAlertAction(title: "Cancel", style: .default) { (action) in
            self.view.endEditing(true)
        }
        
        alarting.addAction(actionAlart)
        alarting.addAction(action2)
        
        present(alarting, animated: true, completion: nil)
   
        }
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var firstVC = segue.destination as! chatViewController
        firstVC.chat = sender as! Group
    }
 
    
    
    var num = ""

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
 
        

        // Do any additional setup after loading the view.
    }

    
    @objc func searchMe() {
        
        if textBox.text == "" {
            chosenGroups = [Group]()
            myTable.reloadData()
            
        } else {
            
            if textBox.text!.characters.count >= 2 {
                
            DataService.instance.getGroup2(search: textBox.text! , handler : { (userrss) in
             
                    self.chosenGroups = userrss
                    self.myTable.reloadData()
                
                
            
                })
                
            
            }
        
        
        }
        
        
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
  

    

    override func viewWillAppear(_ animated: Bool) {
        
        
        
        textBox.delegate = self
        
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        
        
        
        
    textBox.layer.borderColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0).cgColor
    textBox.layer.borderWidth = 0.5
    
    
     textBox.layer.cornerRadius = 8
    
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["view" : "fourth" ])
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).observe( .value , with : { (snapChat) in
            var me = snapChat
            self.num = me.childSnapshot(forPath: "view").value as! String
            
        })
        
      
        
        
        
        
        
        
        
        
        textBox.delegate = self
        
        textBox.text = ""
        chosenGroups = [Group]()
        myTable.reloadData()
        
        
        textBox.addTarget(self, action: #selector(searchMe) , for:  .editingChanged  )
        
      
        
       
        
        
 
        
    }
    
    
    
    
    
}
