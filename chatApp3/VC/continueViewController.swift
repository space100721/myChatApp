//
//  continueViewController.swift
//  chatApp3
//
//  Created by Apple on 2/27/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

class continueViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UIImagePickerControllerDelegate , UINavigationControllerDelegate , UITextFieldDelegate {
    
    var users : [Texts] = []
    
    var info  = "768646"
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    

    
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell66", for: indexPath ) as! chosenTableViewCell
        
        var user = users[indexPath.row]
        
        var email = user.email.components(separatedBy: "@")
        cell.emailUser.text = email[0]
        
        
     
        
        
        if user.image == "768646" {
            
            cell.myImage.image = UIImage(named: "768646")
            
        } else {
            
            cell.myImage.sd_setImage(with: URL(string: user.image))
            
        }
        
        
        
        
        
      
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     myTable.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    
    @IBOutlet weak var saveGroup: UIButton!
    @IBAction func saveGroup(_ sender: Any) {
        
        if groupName.text != ""   {
            
            view.endEditing(true)
        
            saveGroup.isHidden = false
            
            let currentTimeStamp = Date().toMillis()
        showMe(show: true)
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            
        
            var info = ["members" : self.arrayy , "name" : self.groupName.text  , "type" : "g" , "image" : self.info , "boss" : Auth.auth().currentUser!.uid  , "last" : "" , "timme" : currentTimeStamp  , "time2" : ""  , "name2" : "" , "image2"  : ""  ,  "noti" : true  ] as [String : Any]
        DataService.instance.group.childByAutoId().updateChildValues(info)
        
        var story = self.storyboard?.instantiateViewController(withIdentifier: "firstVC")
        self.present(story!, animated: true, completion: nil)
            
            self.showMe(show: false)
        
            }

        } else {
            
            var alart = UIAlertController(title: "", message: "Please write the name  of the group", preferredStyle: .alert )
            
            var action = UIAlertAction(title: "ok", style: .cancel, handler: { (action) in
                self.view.endEditing(true)
            })
            
            alart.addAction(action)
            
            present(alart, animated: true, completion: nil)
        
            
            
        }
    }
    
    
    
    
    var arrayy : [String]?

    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var groupType: UITextField!
    @IBOutlet weak var myImage: circleImage!
    
    
    var picker = UIImagePickerController()
    
    
    @objc func photos() {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var new = info[UIImagePickerControllerOriginalImage] as! UIImage
        myImage.image = new
        
        dismiss(animated: true, completion: nil)
        
        getImage()
    }
    
    
    func getImage () {
        
        var meta = UIImageJPEGRepresentation(myImage.image!, 0.5)
        
        Storage.storage().reference().child("image").child("\(NSUUID().uuidString)").putData(meta!, metadata: nil) { (metaData, error) in
            if error != nil {
                
                print(error)
                
                
            } else {
                
                self.info = (metaData?.downloadURL()?.absoluteString)!
                
                
                
                
            }
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
        
        
        
        
        
        groupName.delegate = self

        
        
        var reco = UITapGestureRecognizer(target: self, action: #selector(photos))
        
        myImage.isUserInteractionEnabled = true
        myImage.addGestureRecognizer(reco)
        
        
        
        picker.delegate = self

        DataService.instance.user.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for me in snapChat {
                
                var meme = Texts()
                
                 meme.email = me.childSnapshot(forPath: "email").value as! String
                
                if self.self.arrayy!.contains(meme.email) {
                    
                 meme.image = me.childSnapshot(forPath: "image").value as! String
                    
                    self.users.append(meme)
                    
                }
                
                
                
            }
            
            
            self.myTable.reloadData()
            
            
        })
        
        
        
   
        // Do any additional setup after loading the view.
    }
    
    
    

    
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 15
    }
    
    



}
