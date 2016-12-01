//
//  LoginVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 11/30/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class LoginVC: UIViewController{
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginPressed(sender: AnyObject){
        
        let email = userEmail.text
        let password = userPassword.text
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("email")
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
        
        if (userEmailStored == email){
            if (userPasswordStored == password){
                //Login Successful
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        displayAlert("Login Failed")
    
    }
    func displayAlert(userMessage: String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
}




