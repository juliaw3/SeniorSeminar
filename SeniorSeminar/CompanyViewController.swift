//
//  CompanyViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table2: UITableView!
    
     var companyOfMifi = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table2.delegate = self
        table2.dataSource = self
        
        parseJSON()
    }
    
    ////////////////
    //parse the main JSON for the main view controller
    
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let companyName2 = anItem["company"] as! String
                
                let newCompany = Company(companyName: companyName2)
                companyOfMifi.append(newCompany)
                
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
        if let cell = tableView.dequeueReusableCellWithIdentifier("CompanyCell", forIndexPath: indexPath)as? CompanyCell{
            
            let company: Company!
            company = companyOfMifi[indexPath.row]
            cell.configureCell(company)
            return cell
            
        } else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyOfMifi.count
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
