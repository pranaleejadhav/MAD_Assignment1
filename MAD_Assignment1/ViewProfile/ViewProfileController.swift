//
//  ViewProfileController.swift
//  MAD_Assignment1
//
//  Created by Pranalee Jadhav on 8/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation
import UIKit
import IHKeyboardAvoiding

class ViewProfileController: UIViewController{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var uname: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var address: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        KeyboardAvoiding.avoidingView = self.scrollView
        self.title = "My Profile"
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
        let uname: String = (self.uname.text?.trimmingCharacters(in: .whitespaces))!
        let age: String = (self.age.text?.trimmingCharacters(in: .whitespaces))!
        let weight: String = (self.weight.text?.trimmingCharacters(in: .whitespaces))!
        let address: String = (self.address.text?.trimmingCharacters(in: .whitespaces))!
        
        if ((uname.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter username")
        } else if ((uname.count) < 5) {
            showMsg(title: "", subTitle: "Username must be atleast 5 characters long")
        } else if ((age.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter age")
        } else if (Int(age)! < 17) {
            showMsg(title: "Oops!", subTitle: "Age must be atleast 18 years")
        } else if ((weight.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter weight")
        }else if ((address.isEmpty) == true) {
            showMsg(title: "", subTitle: "Please enter address")
        }
        else{
            UserDefaults.standard.set(uname, forKey: "username")
            //UserDefaults.standard.set("Anand", forKey: "userid")
            //NotificationCenter.default.post(name: Notification.Name("com.mad.showhomescreen"), object: self, userInfo: nil)
            showMsg(title: "Profile Updated", subTitle: "")
            
        }
    }
    
    func showMsg(title: String, subTitle: String) -> Void {
        let alertController = UIAlertController(title: title, message:
            subTitle, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
