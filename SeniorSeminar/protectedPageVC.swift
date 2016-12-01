//
//  protectedPageVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 11/30/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class protectedPageVC: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        if (!isUserLoggedIn){
            self.performSegueWithIdentifier("loginView", sender: self)
        }
    }
    
    @IBAction func logoutPressed(sender: AnyObject){
    
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.performSegueWithIdentifier("loginView", sender: self)
    }
    
}
