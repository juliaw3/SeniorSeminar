//
//  ViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 9/17/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class ViewController: UIViewController{


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
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "NamePush"){
            let tabVC = segue.destinationViewController as! UITabBarController
            tabVC.selectedIndex = 0
        }
        
        else if(segue.identifier == "LocationPush"){
            let tabVC = segue.destinationViewController as! UITabBarController
            tabVC.selectedIndex = 3
        }
        
        else if(segue.identifier == "IndustryPush"){
            let tabVC = segue.destinationViewController as! UITabBarController
            tabVC.selectedIndex = 2
        }
        
        else if(segue.identifier == "CompanyPush"){
            let tabVC = segue.destinationViewController as! UITabBarController
            tabVC.selectedIndex = 1
        }
        
        else if(segue.identifier == "TimelinePush"){
            let tabVC = segue.destinationViewController as! UITabBarController
            tabVC.selectedIndex = 4
        }
    }
    
}

