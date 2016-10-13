//
//  LocationDetailNameVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/12/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class LocationDetailNameVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var locationNameTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationNameTable.delegate = self
        locationNameTable.dataSource = self
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //instead of creating new cells it just reuses old cells
        if let cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath)as? NameCell{
            
            return cell
            
        } else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //this may need to change when I add more sections
        return 1
    }
    
    //might not need this one?
    /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return CG
    }
    */
    
    
}