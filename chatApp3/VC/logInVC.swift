//
//  logInVC.swift
//  chatApp3
//
//  Created by Apple on 2/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Firebase

class logInVC: UIViewController  , UITextFieldDelegate {
    @IBOutlet weak var logButton: button!
    @IBOutlet weak var passBox: textBox!
    @IBOutlet weak var textBox: textBox!
    @IBOutlet weak var viewwz: UIView!
    
    var group : [String] = []
    
    @IBAction func logButton(_ sender: Any) {
        
        
        
        
        view.endEditing(true)
        
        if textBox.text != "" && passBox.text != "" {
            
            if !textBox.text!.contains("@") {
            
                                
                                
        showMe(show: true)
        
            logButton.setTitle("Entering...", for: .normal)
    
        Auth.auth().signIn(withEmail: "\(textBox.text!)@gmail.com", password: passBox.text!) { (user, error) in
            if error != nil {
                
                
                Auth.auth().createUser(withEmail: "\(self.textBox.text!)@gmail.com", password: self.passBox.text!, completion: { (user, error) in
                    if error != nil {
                        
                        self.showMe(show: false)
                        
                        if let errorCodee = AuthErrorCode(rawValue: error!._code) {
                            
                            switch errorCodee {
                                
                            case.networkError :
                                var alartt = UIAlertController(title: "Network Error", message: "Please check your internet connection", preferredStyle: .alert )
                                var actionn = UIAlertAction(title: "Cancel", style: .default  , handler: { (action) in
                                    self.view.endEditing(true)
                                })
                                
                                alartt.addAction(actionn)
                                self.present(alartt , animated: true , completion: nil)
                                
                          
                                
                         
                            case .emailAlreadyInUse:
                              
                                var alartt = UIAlertController(title: "UserName Error", message: "This UserName is Already used", preferredStyle: .alert )
                                var actionn = UIAlertAction(title: "Cancel", style: .default  , handler: { (action) in
                                    self.view.endEditing(true)
                                })
                                
                                alartt.addAction(actionn)
                                self.present(alartt, animated: true , completion: nil)
                                
                                
                                
                                
                                
                            case .invalidEmail:
                               
                                
                                var alartt = UIAlertController(title: "Invalid UserName ", message: "This UserName is Invalid", preferredStyle: .alert )
                                var actionn = UIAlertAction(title: "Cancel", style: .default  , handler: { (action) in
                                    self.view.endEditing(true)
                                })
                                
                                alartt.addAction(actionn)
                                self.present(alartt, animated: true , completion: nil)
                                
                                
                                
                                
                                
                                
                                
                                
                            case .wrongPassword:
                              
                                
                                var alartt = UIAlertController(title: "Wrong Password", message: "You entred wrong PassWord", preferredStyle: .alert )
                                var actionn = UIAlertAction(title: "Cancel", style: .default  , handler: { (action) in
                                    self.view.endEditing(true)
                                })
                                
                                alartt.addAction(actionn)
                                self.present(alartt, animated: true , completion: nil)
                                
                                
                                
                           
                         
                            case .weakPassword:
                            
                                var alartt = UIAlertController(title: "Weak PassWord", message: "You used Weak PassWord", preferredStyle: .alert )
                                var actionn = UIAlertAction(title: "Cancel", style: .default  , handler: { (action) in
                                    self.view.endEditing(true)
                                })
                                
                                alartt.addAction(actionn)
                                self.present(alartt, animated: true , completion: nil)
                                
                                
                            
                        
                      
                         
                        
                          
                                
                            default :
                                
                                
                                var alartt = UIAlertController(title: "Error", message: "Error happened", preferredStyle: .alert )
                                var actionn = UIAlertAction(title: "Cancel", style: .default  , handler: { (action) in
                                    self.view.endEditing(true)
                                })
                                
                                alartt.addAction(actionn)
                                self.present(alartt, animated: true , completion: nil)
                                
                                
                                
                                
                                
                            
                       
                          
                            }
                            
                            
                        }
                        
                        
                        self.logButton.setTitle("LOG IN /  SIGN UP", for: .normal)
                        self.showMe(show: false)
                        
                        
                    } else {
                        
                        var info = ["email" : user?.email , "image" : "768646"  , "Online" : true , "groups" : self.group  ] as [String : Any]
                        
                        Database.database().reference().child("users").child(user!.uid).updateChildValues(info)
                     
                        var story = self.storyboard!.instantiateViewController(withIdentifier: "firstVC")
                        self.present(story, animated: true, completion: nil)
                        
                        print("success")
                        self.showMe(show: false)
                        
                    }
                })
                    
                
                
            } else {
                
                 print("success")
                
                self.logButton.setTitle("Entering...", for: .normal)
                var story = self.storyboard!.instantiateViewController(withIdentifier: "firstVC")
                self.present(story, animated: true, completion: nil)
                 self.showMe(show: false)
            }
            }
                
                
            } else {
                
                
                
                var alart = UIAlertController(title: "Error " , message: "UserName contain the character '@' " , preferredStyle: .alert)
                var action = UIAlertAction(title: "Cancel", style: .default , handler: { (alart) in
                    self.view.endEditing(true)
                })
                
                alart.addAction(action)
                present(alart, animated: true , completion: nil)
                
                
            }
            
            
            }
      
    }
    
    
    @IBOutlet weak var logo: UIImageView!
    @objc func endMe () {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = viewwz.bounds
      
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewwz.addSubview(blurEffectView)
        
        
        
        
        
        
        var rec = UITapGestureRecognizer(target: self, action: #selector(endMe))
        view.addGestureRecognizer(rec)
        
        textBox.delegate = self
        passBox.delegate = self

        logo.observing3()
     
        textBox.observing3()
        passBox.observing3()
        logButton.observing3()
        

        // Do any additional setup after loading the view.
    }
    
    
    func TwoColorAnimateBackground() {
        
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        var color = colors[randomIndex]
        
        UIView.animate(withDuration: 1, animations: {
            self.viewwz.backgroundColor = color
        }, completion: {
            (completed : Bool) -> Void in
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                self.viewwz.backgroundColor = color
            }, completion: {
                (completed : Bool) -> Void in
                self.TwoColorAnimateBackground()
            })
        })
    }
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    
    
    var colors: [UIColor] = [UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 0.5),
                             UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 0.5),
                             UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 0.5),
                             UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 0.5),
                             UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 0.5),
                             UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 0.5),
                             UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 0.5)]
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    
        
        
        
        
        self.TwoColorAnimateBackground()
        
          self.logButton.setTitle("LOG IN /  SIGN UP", for: .normal)
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textBox.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 9
    }
    
    

    
}
