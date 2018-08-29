//
//  HomeScreenViewController.swift
//  MAD_Assignment1
//
//  Created by Pranalee Jadhav on 8/28/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation
import UIKit

class HomeScreenViewController: UIViewController{
    
    @IBOutlet weak var welcome_lb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hide navigation bar
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        // set welcome message
        let uname = UserDefaults.standard.string(forKey: "username")
        welcome_lb.text = "Welcome " + uname!
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func showProfile(_ sender: Any) {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        //redirect to profile page
        let newViewController: ViewProfileController = storyboard.instantiateViewController(withIdentifier: "ViewProfileController") as! ViewProfileController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        //clear userdefaults to logout user
        UserDefaults.standard.removeObject(forKey: "userid")
        UserDefaults.standard.removeObject(forKey: "username")
        NotificationCenter.default.post(name: Notification.Name("com.mad.showhomescreen"), object: self, userInfo: nil)
        
    }
}
