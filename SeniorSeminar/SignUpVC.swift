//
//  SignUpVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 11/30/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController{
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpBtnPressed(sender: AnyObject){
    
        let email = userEmail.text;
        let password = userPassword.text;
        let password2 = confirmPassword.text;
        
        //check for empty fields
        if (email!.isEmpty || password!.isEmpty || password2!.isEmpty){
            //Display Alert
            displayAlert("All fields are required")
            
            return;
            
        }
        //check password matching
        if (password != password2){
            //Display Alert
            displayAlert("Passwords do not match")
            return;
        }
        //Store Data
        NSUserDefaults.standardUserDefaults().setObject(email, forKey: "email")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //Display Alert Message with confirmation
        var myAlert = UIAlertController(title: "Alert", message: "Registration was successful. Thank you", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) {action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    func displayAlert(userMessage: String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}







