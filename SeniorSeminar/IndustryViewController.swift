//
//  IndustryViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class IndustryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table3: UITableView!
    
    var industryOfMifi = [Industry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table3.delegate = self
        table3.dataSource = self
        
        parseJSON()
    }
    
    ////////////////
    //parse the main JSON for the main view controller
    
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let mifiIndustry2 = anItem["mediaIndustry"] as! String
                
                let newIndustry = Industry(industryName: mifiIndustry2)
                industryOfMifi.append(newIndustry)
            }
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
    }
    
    /////////////////////////
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //instead of creating new cells it just reuses old cells
        if let cell = tableView.dequeueReusableCellWithIdentifier("IndustryCell", forIndexPath: indexPath)as? IndustryCell{
            
            let industry: Industry!
            industry = industryOfMifi[indexPath.row]
            cell.configureCell(industry)
            return cell
            
        } else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
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
