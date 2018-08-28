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
        self.navigationController?.navigationBar.isHidden = true
        //UserDefaults.standard.set("Anand", forKey: "username")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewWillAppear(_ animated: Bool) {
        let uname = UserDefaults.standard.string(forKey: "username")
        welcome_lb.text = "Welcome " + uname!
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func showProfile(_ sender: Any) {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        let newViewController: ViewProfileController = storyboard.instantiateViewController(withIdentifier: "ViewProfileController") as! ViewProfileController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "userid")
        UserDefaults.standard.removeObject(forKey: "username")
        NotificationCenter.default.post(name: Notification.Name("com.mad.showhomescreen"), object: self, userInfo: nil)
        
    }
}
