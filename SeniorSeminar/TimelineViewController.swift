//
//  TimelineViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/11/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var month1Lbl: UILabel!
    @IBOutlet weak var month2Lbl: UILabel!
    @IBOutlet weak var month3Lbl: UILabel!
    
    @IBOutlet weak var date1: UILabel!
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var date3: UILabel!
    @IBOutlet weak var date4: UILabel!
    @IBOutlet weak var date5: UILabel!
    @IBOutlet weak var date6: UILabel!
    @IBOutlet weak var date7: UILabel!
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            month1Lbl.text = "August";
            month2Lbl.text = "September";
            month3Lbl.text = "October";
            date1.text = "2nd"
            date2.text = "14th"
            date3.text = "28th"
            date4.text = "7th"
            date5.text = "22nd"
            date6.text = "15th"
            date7.text = "30th"
        case 1:
            month1Lbl.text = "May";
            month2Lbl.text = "June";
            month3Lbl.text = "July";
            date1.text = "10th"
            date2.text = "18th"
            date3.text = "29th"
            date4.text = "15th"
            date5.text = "28th"
            date6.text = "9th"
            date7.text = "23rd"
        default:
            break;
        }
    }
    
    
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