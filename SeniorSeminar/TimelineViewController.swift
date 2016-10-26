//
//  TimelineViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/11/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    var timeline: Name!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func USButton (sender: UIButton!){
        performSegueWithIdentifier("TimePush", sender: nil)
    }
}
//numberOfSections in Table View needs to be used