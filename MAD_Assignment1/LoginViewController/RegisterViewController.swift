//
//  RegisterViewController.swift
//  MAD_Assignment1
//
//  Created by Pranalee Jadhav on 8/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation
import UIKit
import IHKeyboardAvoiding

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var rpwd: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var address: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         KeyboardAvoiding.avoidingView = self.scrollView
    }
    
    @IBAction func register(_ sender: Any) {
        let uname: String = (name.text?.trimmingCharacters(in: .whitespaces))!
        let pwd: String = (self.pwd.text?.trimmingCharacters(in: .whitespaces))!
        let age: String = (self.age.text?.trimmingCharacters(in: .whitespaces))!
        let rpwd: String = (self.rpwd.text?.trimmingCharacters(in: .whitespaces))!
        let weight: String = (self.weight.text?.trimmingCharacters(in: .whitespaces))!
        let address: String = (self.address.text?.trimmingCharacters(in: .whitespaces))!
        
        if ((uname.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter username")
        } else if ((uname.count) < 5) {
            showMsg(title: "", subTitle: "Username must be atleast 5 characters long")
        } else if ((pwd.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter password")
        } else if ((pwd.count) < 6) {
            showMsg(title: "", subTitle: "Password must be atleast 6 characters long")
        }else if ((rpwd.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please re-enter password")
        } else if (rpwd != pwd) {
            showMsg(title: "", subTitle: "Passwords do not match")
        } else if ((age.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter age")
        }else if ((weight.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter weight")
        }else if ((address.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter address")
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
   
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
