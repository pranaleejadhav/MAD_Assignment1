//
//  LoginViewController.swift
//  MAD_Assignment1
//
//  Created by Pranalee Jadhav on 8/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation
import UIKit
import IHKeyboardAvoiding

class LoginViewController: UIViewController{
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signup_link: UILabel!
    
    @IBOutlet weak var avoidingView: KeyboardDismissingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        //tap.delegate = self // This is not required
        signup_link.addGestureRecognizer(tap)
        signup_link.isUserInteractionEnabled = true
        KeyboardAvoiding.avoidingView = self.avoidingView
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        let newViewController: RegisterViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func signin(_ sender: Any) {
        
        let uname: String = (username.text?.trimmingCharacters(in: .whitespaces))!
        let pwd: String = (password.text?.trimmingCharacters(in: .whitespaces))!
        
        if ((uname.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter username")
            
        }
        else if ((pwd.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter password")
            }
        else{
            UserDefaults.standard.set(uname, forKey: "username")
            UserDefaults.standard.set("Anand", forKey: "userid")
            NotificationCenter.default.post(name: Notification.Name("com.mad.showhomescreen"), object: self, userInfo: nil)

            
        }

        
    }
    
    func showMsg(title: String, subTitle: String) -> Void {
        let alertController = UIAlertController(title: title, message:
            subTitle, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

