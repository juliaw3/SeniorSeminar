//
//  IndustryNameListVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/9/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class IndustryNameListVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var industryNameTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        industryNameTable.delegate = self
        industryNameTable.dataSource = self
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
        return 30
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