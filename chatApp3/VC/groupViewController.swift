//
//  groupViewController.swift
//  chatApp3
//
//  Created by Apple on 2/19/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

class groupViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate {
    
    @IBOutlet weak var labelUsers: UILabel!
  
    @IBOutlet weak var groupMemvers: UITextField!
    
    var users : [Texts] = []
    var chosen : [String] = []
    var showw : [String] = []
    var names : [String] = []
    
    
    @IBOutlet weak var myTable: UITableView!
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
        
    }
    
    @IBOutlet weak var saveGroup: UIButton!
    @IBAction func saveGroup(_ sender: Any) {
        
        if labelUsers.text != "" {
            
           
            var email = Auth.auth().currentUser!.email!
            
            chosen.append(email)
       
           var members  = chosen
    
            if members.count <= 3 {
              
                var alart = UIAlertController(title: "", message: "You need to add moew members to creat a group", preferredStyle: .alert)
                var action = UIAlertAction(title: "Ok", style: .default  , handler: { (action) in
                    print("3")
                })
                
                alart.addAction(action)
                present(alart, animated: true, completion: nil)
                
                
                
                
                
                
            } else {
            
        
            performSegue(withIdentifier: "continue", sender: members)
                
            }
            
            
            
        } else {
            
            
            var alart = UIAlertController(title: "Add Users", message: "Plase add users", preferredStyle: .alert)
            var action = UIAlertAction(title: "Ok", style: .default  , handler: { (action) in
                print("3")
            })
            
            alart.addAction(action)
            present(alart, animated: true, completion: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
   
        
        
        var firstVC = segue.destination as! continueViewController
        firstVC.arrayy = sender as? [String]
            
        
    }
    
    
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! creatGroupTableViewCell
        var me = users[indexPath.row]
        
        var email = me.email.components(separatedBy: "@")
        cell.emailLabel.text = email[0]
        
        
 
        
       
        if me.image == "768646" {
            
            cell.myImage.image = UIImage(named: "768646")
            
        } else {
            
            cell.myImage.sd_setImage(with: URL(string: me.image))
            
        }
        
    
        if names.contains(me.email) {
            cell.accessoryType = .checkmark
        } else {
            
             cell.accessoryType = .none
        }
        
        
        return cell
    
        
    }
    
    
 
    
    @objc func getUsers () {
        if groupMemvers.text == "" {
            users = [Texts]()
            myTable.reloadData()
        } else {
            
             if groupMemvers.text != "@" && groupMemvers.text!.characters.count >= 2 {
                
            DataService.instance.getUser(search: groupMemvers.text!, handler: { (userrs) in
                self.users = userrs
                self.myTable.reloadData()
            })
            
            }
            
        }
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var me = users[indexPath.row]
        var name = me.email
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            
           
            
            if cell.accessoryType == .checkmark{
            
                
                cell.accessoryType = .none
                
                
            } else {
                
                
            
                
                
                cell.accessoryType = .checkmark
            }
        }
        
   
        
        
        
        if !chosen.contains(name) {
            var mem = name.components(separatedBy: "@")
            
        
            
            saveGroup.isHidden = false
         
            chosen.append(name)
            
            showw.append(mem[0])
            
            names.append(name)
            
            
            labelUsers.text = showw.joined(separator: " , ")
            
            
        } else {
            
        
          
            
            var mem = name.components(separatedBy: "@")
            
            showw = showw.filter({ $0 != mem[0] })
            
              chosen = chosen.filter({ $0 != name  })
            
            names = names.filter({ $0 != name  })
            
          labelUsers.text = showw.joined(separator: " , ")
            
            if chosen.count == 0 {
                
                labelUsers.text = "no members"
                saveGroup.isHidden = true
            
                
                
                
            }
            
            
           
            
            
            
            
        }
        
    
        
        
        
    }
    
  
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        labelUsers.text = "no members"
        saveGroup.isHidden = true
        

  
        groupMemvers.addTarget(self, action: #selector(getUsers) , for: .editingChanged   )
        
        groupMemvers.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        
        
    }
    
    
  
   
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = groupMemvers.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 15
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
    
        
        
        
        
        
    }
    
   

}
