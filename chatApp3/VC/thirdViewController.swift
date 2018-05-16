//
//  thirdViewController.swift
//  chatApp3
//
//  Created by Apple on 2/18/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

import AudioToolbox

import AVFoundation

import MessageUI


class thirdViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate , MFMailComposeViewControllerDelegate {
    
    var myText : [Texts] = []
    
    var timer3 = 0
    
    var time4 = 0
    
    
       var audioPlayer = AVAudioPlayer()
  
    var timerr = 0

    var groups : [Group] = []
    var members : [String] = []
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var myImage: circleImage!
    @IBAction func logOut(_ sender: Any) {
        
        
        
        var alart = UIAlertController(title: "Log out", message: "Do you want to log out ?", preferredStyle: .alert)
        var action = UIAlertAction(title: "LOG out", style: .default) { (action) in
            
            let ref = DataService.instance.user.child(Auth.auth().currentUser!.uid).child("Online").setValue("false")
            
            self.showMe(show: true)
            
             Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
            
            do {
                
            
               
                    
                
                
              
         
                try Auth.auth().signOut()
                
                
                
               
                    
                 
                 
                    self.showMe(show: false)
                
                var story = self.storyboard?.instantiateViewController(withIdentifier: "log")
                self.present(story!, animated: true, completion: nil)
                    
                
                
            } catch {
                
                
            }
                
                })
            
        }
        
        
        var action1 = UIAlertAction(title: "cancel", style: .default) { (action) in
            self.view.endEditing(true)
        }
        
        alart.addAction(action)
        alart.addAction(action1)
        
        present(alart, animated: true, completion: nil)
      
    }
    
    
    
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
 
     
        
        
        
        
        
        
        picker.delegate = self
        myImage.isUserInteractionEnabled = true
        var reco = UITapGestureRecognizer(target: self, action: #selector(getImage))
        myImage.addGestureRecognizer(reco)

        // Do any additional setup after loading the view.
    }
    
    @objc func getImage () {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
        
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var new = info[UIImagePickerControllerOriginalImage] as! UIImage
        myImage.image = new
        dismiss(animated: true, completion: nil)
        saveImage()
    }
    
    var imae : String?
    
    func saveImage () {
        
        var userImage = myImage.image?.lowestQualityJPEGNSData
        
        Storage.storage().reference().child("image").child(Auth.auth().currentUser!.uid).putData( userImage as! Data , metadata: nil) { (metaData, error) in
            
            var imageString = metaData?.downloadURL()?.absoluteString
            
            self.imae = imageString
            
            var alartt = UIAlertController(title: "", message: "Image Saved and Changed", preferredStyle:  .alert  )
            
            var actionn = UIAlertAction(title: "OK", style: .default  , handler: { (alartt) in
                print("hey")
            })
            
            alartt.addAction(actionn)
            
            self.present(alartt, animated: true, completion: nil)
            
            
            
            
            
            
            
            DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["image" : imageString ])
        
            self.updateImage()
            
        }
    
        
        
        
        
    }
    
    
    
    func updateImage() {
        
        DataService.instance.group.observeSingleEvent(of: .value , with : { (snapChat) in
            guard let snapChatt = snapChat.children.allObjects as? [DataSnapshot] else {return}
            
            for me in snapChatt {
                
                var members = me.childSnapshot(forPath: "members").value as? NSArray
            
                
                if members!.contains(Auth.auth().currentUser?.email) {
                
                    var name = me.childSnapshot(forPath: "name").value as? String
                    
                    var name2 = me.childSnapshot(forPath: "name2").value as? String
                    
                     var type = me.childSnapshot(forPath: "type").value as? String
                    
                    var key = me.key
                    
                    if type == "p" {
                 
                    if name == Auth.auth().currentUser?.email {
                        
                        DataService.instance.group.child(key).updateChildValues([ "image" : self.imae ] )
                        
                  
                   
                    }
                        
                    
                        if name2 == Auth.auth().currentUser?.email {
                            
                              DataService.instance.group.child(key).updateChildValues([ "image2" : self.imae ] )
                            
                        }
                        
                        
                    
                    
                    }
                    
                
                }
            }
            
        })
        
        
        
        
    }
    
    
    
    
    var num = ""
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    
        
        
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).updateChildValues(["view" : "third" ])
        
        DataService.instance.user.child(Auth.auth().currentUser!.uid).observe( .value , with : { (snapChat) in
            var me = snapChat
            self.num = me.childSnapshot(forPath: "view").value as! String
            
        })
        
        
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        
        
        self.time4 = 0
        
        
        timer3 = 0
        
        myImage.layer.borderWidth = 1
        myImage.layer.borderColor = UIColor(red:0.83, green:0.98, blue:0.47, alpha:1.0).cgColor
        
     
        
        
        
        
        
        
        
        
        
        
        
        var me = Auth.auth().currentUser!.email!
        
        var meme = me.components(separatedBy: "@")
        
        self.emailLabel.text = meme[0]
            
        
        
        
        
        
        myText = [Texts]()
        
        DataService.instance.text.observe(.value , with: { (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for snap in snapChat {
                
            
                
                var me = Texts()
                me.email = snap.childSnapshot(forPath: "email").value as! String
                
                
                if snap.hasChild("image") {
                
                
                me.image = snap.childSnapshot(forPath: "image").value as! String
                    
                }
                
                
                me.text = snap.childSnapshot(forPath: "text").value as! String
                var email = Auth.auth().currentUser!.email
                
                if me.email.contains(email!) {
                
                self.myText.append(me)
                    
                }
                
              
                
              
                
                
            }
            
            self.myText.reverse()
            
            
           
            
          
            
            
            
        })
        
        
        
        
        
        
        
        
        
        
        
        DataService.instance.user.observe(.value , with :{ (snapChat) in
            guard let snapChat = snapChat.children.allObjects as? [DataSnapshot] else {return}
            for snapp in snapChat {
                if snapp.key == Auth.auth().currentUser!.uid {
                    
            
                    
                    
                    
                    if  snapp.hasChild("image") {
                        
                    
                        
                        
                        var getImage = snapp.childSnapshot(forPath: "image").value as? String
                        
                        if getImage == "768646" {
                            
                            self.myImage.image = UIImage(named: "768646")
                            
                        } else {
                        
                        
                        self.myImage.sd_setImage(with: URL(string: getImage!))
                        
                        }
                        
                        
                        
                    }
                    
                }
            }
        })
    }
    
  
 
    
   
    @IBAction func unBlocking(_ sender: Any) {
        performSegue(withIdentifier: "unBlock", sender: nil )
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["spacemonkey100721@gmail.com"])
        mailComposerVC.setSubject("Hello")
        mailComposerVC.setMessageBody("Do you have any suggestions to improve the app ??", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    



}
