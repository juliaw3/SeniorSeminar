//
//  NameViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var table: UITableView!
    
    var nameOfMifi = [Name]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        parseJSON()
    }
    
    ////////////////
    //parse the main JSON for the main view controller
    
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let mifiName2 = anItem["name"] as! String
                
                let newName = Name(mifiName: mifiName2)
                nameOfMifi.append(newName)
                //print("Name: \(newName)")

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
        if let cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath)as? NameCell{
            
            let name: Name!
            name = nameOfMifi[indexPath.row]
            //print("Did we get here?: \(name)")
            cell.configureCell(name)
            return cell
            
        } else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfMifi.count
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
