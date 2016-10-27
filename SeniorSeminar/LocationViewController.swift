//
//  LocationViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/11/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func USButton (sender: UIButton!){
        performSegueWithIdentifier("USPush", sender: nil)
    }
    @IBAction func SAButton (sender: UIButton!){
        performSegueWithIdentifier("SAPush", sender: nil)
    }
    @IBAction func EUButton (sender: UIButton!){
        performSegueWithIdentifier("EUPUsh", sender: nil)
    }
    @IBAction func AfricaButton (sender: UIButton!){
        performSegueWithIdentifier("AfricaPush", sender: nil)
    }
    @IBAction func AsiaButton (sender: UIButton!){
        performSegueWithIdentifier("AsiaPush", sender: nil)
    }
    @IBAction func AustraliaButton (sender: UIButton!){
        performSegueWithIdentifier("AustraliaPush", sender: nil)
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}