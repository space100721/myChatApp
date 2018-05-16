//
//  addNewViewController.swift
//  chatApp3
//
//  Created by Apple on 3/2/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class addNewViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UINavigationControllerDelegate , UIImagePickerControllerDelegate , UITextFieldDelegate {
    
    @IBOutlet weak var Gname: UILabel!
    @IBOutlet weak var numbers: UILabel!
    
    @IBOutlet weak var myImage: circleImage!
    @IBOutlet weak var myImagez: UIImageView!
    var info  = "768646"
    var memz : Int?
    var name : String?
    
    var bigG : Group?
    var boss : String?
    

    @IBOutlet weak var textBox: textBox!
    @IBOutlet weak var addName: UITextField!
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var labelArray: UILabel!
    var keys : String?
    
    var keys2 : String?
    
    var users22 : [String] = []
    
    var mem : NSArray?
    
    
    var user: [Texts] = []
    var names : [String] = []
    var oldUsers : [String] = []
    
    var chosen : [String] = []
    var showw : [String] = []
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.myTable {
        
        return user.count
            
        } else if tableView == self.myTable2 {
            
            return oldUserss.count
        }
        
        return 0
        
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           var collecter = UITableViewCell()
        
        if tableView == self.myTable {
         
        let cell = myTable.dequeueReusableCell(withIdentifier: "Cell88", for: indexPath) as! addUserTableViewCell
        
     
            var use = user[indexPath.row]
            
            var split = use.email.components(separatedBy: "@")
            
            cell.userEmail.text = split[0]
            
            
            if use.image == "768646" {
                
                cell.myImage.image = UIImage(named: "768646")
                
            } else {
                
                cell.myImage.sd_setImage(with: URL(string: use.image))
                
            }
            
            
            if names.contains(use.email) {
                cell.accessoryType = .checkmark
            } else {
                
                cell.accessoryType = .none
            }
            
            
            return cell
            
        
    
        } else if  tableView == self.myTable2 {
            
            let cell2 = myTable2.dequeueReusableCell(withIdentifier: "heyyy", for: indexPath) as! TableViewCelllastLest
            
            var ext = oldUserss[indexPath.row]
            
            var hey = ext.email.components(separatedBy: "@")
            var name = hey[0]
           
            cell2.emailLabel?.text = name
    
            if ext.image == "768646" {
                
                cell2.myImage?.image = UIImage(named: "768646")
                
            } else {
                
                cell2.myImage?.sd_setImage(with: URL(string: ext.image))
                
            }
            
            return cell2
        }
        
        return collecter
        
    }
    
    
    
    func saveImage() {
        
        var neww =  myImage.image?.lowestQualityJPEGNSData
            
            
        Storage.storage().reference().child("image").child(NSUUID().uuidString).putData(neww! as Data, metadata: nil) { (metaDataa, error) in
            if error != nil {
                
                
            } else {
                
                
                var alartt = UIAlertController(title: "", message: "Image Saved and Changed", preferredStyle:  .alert  )
                
                var actionn = UIAlertAction(title: "OK", style: .default  , handler: { (alartt) in
                    print("hey")
                })
                
                alartt.addAction(actionn)
                
                self.present(alartt, animated: true, completion: nil)
                
                
                
                
                
                self.info =  (metaDataa?.downloadURL()?.absoluteString)!
                
                DataService.instance.group.child(self.keys!).updateChildValues(["image" : self.info])
                
          
            }
        }
    }
    
    
    var oldUserss : [Texts] = []
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        textBox.layer.borderColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0).cgColor
        textBox.layer.borderWidth = 0.5
        
        
        textBox.layer.cornerRadius = 8
        
        
        addName.layer.borderColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0).cgColor
        addName.layer.borderWidth = 0.5
        
        
        addName.layer.cornerRadius = 8
        
        
        
        
        
        
        if bigG != nil {
        
        Gname.text = bigG!.name
        numbers.text = "\(bigG!.members!.count) members"
        
        if bigG?.image == "768646" {
            
            self.myImagez.image = UIImage(named: "768646")
            
            
        } else {
            
            self.myImagez.sd_setImage(with: URL(string: (bigG?.image)!))
            
            
        }
            
        }
        
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
        
        
        print("55555555\(keys2)")
        
        if keys2 == nil {
            
            view2.isHidden = true
            
            
        }
        
        
        
       oldUserss = [Texts]()
        
        Timer.scheduledTimer(withTimeInterval: 0.5 , repeats: false) { (timer) in
        
        
        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            
            guard let snapp = snapChat.children.allObjects as? [DataSnapshot] else {return}
            
      
         
            for me in snapp {
                
                var text = Texts()
                text.email = me.childSnapshot(forPath: "email").value as! String
                
                if self.users22.contains(text.email) {
                    
                    text.image = me.childSnapshot(forPath: "image").value as! String
                    
                    
                    self.oldUserss.append(text)
                    
                    print("3333333\(text.email)")
                    
                }
                
                
                
                
                
                
            }
            
            
            self.myTable2.reloadData()
            
          
            
            
            
        })
        
        
        }
       
        
        
            
            
        DataService.instance.group.observeSingleEvent(of: .value , with : { (snapChat) in
            
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            
            for me in snapChat {
                
                if me.key == self.keys {
                    
                    self.boss =  me.childSnapshot(forPath: "boss").value as? String

                
                    self.mem = me.childSnapshot(forPath: "members").value as? NSArray
                    
                  
                    self.memz = self.mem?.count
                    

                    self.name  = me.childSnapshot(forPath: "name").value as! String
                    var image = me.childSnapshot(forPath: "image").value as! String
                    
                    if image == "768646" {
                        
                        self.myImage.image = UIImage(named: "768646")
                        
                        
                    } else {
                        
                        self.myImage.sd_setImage(with: URL(string: image))
                        
                        
                    }
                    
                    
                    
                    var members = me.childSnapshot(forPath: "members").value as! NSArray
                    
                    self.oldUsers = members as! [String]
                    
                    print(members)
                    
                    print("8888")
                    
                    
                }
                
                
                
                
            }
            
            
        })
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
       
        
            if self.memz != nil {
                print("wwwww\(self.memz)")
                if self.memz! <= 49 {
                   
                    print("ayy")
                    
                } else {
                    
                    self.textBox.isUserInteractionEnabled = false
                    self.textBox.text = "Group is fulll"

                  
                  
                    
                    
                }
        
        }
            
        }
        
    }
    
    
    
    @objc func getImage() {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var new = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        Timer.scheduledTimer(withTimeInterval: 0.3 , repeats: false) { (timer) in
         
        
            self.myImage.image = new
            
        }
        
        
        
        dismiss(animated: true, completion: nil)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            
            self.saveImage()
            
        }
        
        
    }
    
    
    
 
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textBox.delegate = self
        addName.delegate = self
        
        
        var rec = UITapGestureRecognizer(target: self, action: #selector(getImage))
        myImage.isUserInteractionEnabled = true
        myImage.addGestureRecognizer(rec)
        
        picker.delegate = self

        textBox.addTarget(self, action: #selector(addMe), for: .allEvents)
      
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView == self.myTable {
        
        var user = self.user[indexPath.row]
        
        var name = user.email
        
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            
            
            
            if cell.accessoryType == .checkmark{
                
                
                cell.accessoryType = .none
                
                
            } else {
                
              
                
                cell.accessoryType = .checkmark
            }
        }
        
        
        
        if chosen.contains(user.email) {
            
          var mem = user.email.components(separatedBy: "@")
            
            chosen = chosen.filter({ $0 != user.email })
            
            showw = showw.filter({ $0 != mem[0] })
             labelArray.text = showw.joined(separator: " , ")
            
            names = names.filter({ $0 != user.email })
            
        } else {
            
            chosen.append(user.email)
            
            var mem = user.email.components(separatedBy: "@")
            
            showw.append(mem[0])
            names.append(user.email)
            
            labelArray.text = showw.joined(separator: " , ")
            
            
            if oldUsers.contains(user.email) {
                
                print("666")
                
                
            } else {
                
            
     
                
            oldUsers = oldUsers.filter({ $0 != user.email  })
            
            oldUsers.append(user.email)
                
            }
            
            
        }
            
        } else if tableView == myTable2 {
            
            var er = oldUserss[indexPath.row]
            
            performSegue(withIdentifier: "makkka", sender: er)
            
            
        myTable2.deselectRow(at: indexPath, animated: true)
            
            
        }
        
    }


    @objc func addMe() {
        
        if textBox.text == "" {
            
            user = [Texts]()
            
        } else {
            if textBox.text != "@" && textBox.text!.characters.count >= 2 {
            
            DataService.instance.getUser(search: textBox.text!, handler: { (group) in
                
           
            
                
                self.user = group
                
                
                
                
                
                self.myTable.reloadData()
                
                
                
                
                })
            
        
            }
            
            
        }
        
        
    }
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveButton(_ sender: Any) {
        
        if labelArray.text != ""   ||  addName.text != "" {
        
        showMe(show: true)
            
            view.endEditing(true)
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
       
      
 
            if self.addName.text == "" {
                
                DataService.instance.group.child(self.keys!).updateChildValues(["name" : self.name])
                
            } else {
                
                DataService.instance.group.child(self.keys!).updateChildValues(["name" : self.addName.text])
                
            }
            DataService.instance.group.child(self.keys!).updateChildValues(["members" : self.oldUsers ])
            
            self.showMe(show: false)
            
            self.dismiss(animated: true , completion: nil)
            
            }
            
            
        } else {
            
            var alart = UIAlertController(title: "Make Changes ", message: "Add New Members or Change The Group Name", preferredStyle: .alert)
            var action = UIAlertAction(title: "Ok", style: .default  , handler: { (action) in
                print("3")
            })
            
            alart.addAction(action)
            present(alart, animated: true, completion: nil)
            
            
            
            
        }
      
           
        
 
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "makkka" {
        var firstVC =  segue.destination as! proFileViewController
        firstVC.user = sender as? Texts
        }
    }

    
    
    @IBAction func delette(_ sender: Any) {
        
        var alart = UIAlertController(title: "", message: "Do you want to leave this group", preferredStyle: .alert)
        
        var action = UIAlertAction(title: "Leave", style: .default) { (action) in
            
            
            
            self.showMe(show: true)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
                
                self.showMe(show: false)
                
                var story = self.storyboard?.instantiateViewController(withIdentifier: "firstVC")
                self.present(story!, animated: true, completion: nil)
                
                self.oldUsers = self.oldUsers.filter({ $0 != Auth.auth().currentUser!.email  })
                
                  DataService.instance.group.child(self.keys!).updateChildValues(["members" : self.oldUsers ])
                
                
            }
            
            
            
            
        }
        
        var action2 = UIAlertAction(title: "Cancel", style: .default) { (action) in
            self.view.endEditing(true)
        }
        

        alart.addAction(action)
        alart.addAction(action2)
        
        present(alart, animated: true, completion: nil)
        
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
        
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 15
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        UIView.animate(withDuration: 0.1) {
            
            self.view.endEditing(true)
       
            
        }
        
        
        return true
        
        
        
        
    }
    @IBOutlet weak var myTable2: UITableView!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var outting: UIButton!
    @IBAction func outting(_ sender: Any) {
        
      dismiss(animated: true, completion: nil)
     
        
    }
    
    
    
    
    
    

}
