//
//  IndustryDetailVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/11/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class IndustryDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    
    @IBOutlet weak var industryNameTable: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var inSearch = false
    var industry: Industry!
    var name: Name!
    
    var filteredSearch = [Name]()
    var industryOfMifi = [Name]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        industryNameTable.delegate = self
        industryNameTable.dataSource = self
        searchbar.delegate = self 
        searchbar.returnKeyType = UIReturnKeyType.Done
        
        parseJSON()
    }
    
    //////////////
    //parse the main JSON for the main view controller
    
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let industry = anItem["mediaIndustry"] as! String
                /*
                if industry == "Interactive Media" {
                    let mifiIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newIndustry = Name(mifiName: mifiIndustry, mifiId: mifiId)
                    industryOfMifi.append(newIndustry)
                }
*/
                if industry == "Newspaper" {
                    let mifiIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newIndustry = Name(mifiName: mifiIndustry, mifiId: mifiId)
                    industryOfMifi.append(newIndustry)
                }
                    /*
                else if industry == "Radio" {
                    let mifiIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newIndustry = Name(mifiName: mifiIndustry, mifiId: mifiId)
                    industryOfMifi.append(newIndustry)
                }
*/
                
            }
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
    }
    
    /////////////////////////
    
    
    @IBAction func BtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //instead of creating new cells it just reuses old cells
        if let cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath)as? NameCell{
            
            let industry: Name!
            
            if inSearch{
                industry = filteredSearch[indexPath.row]
            }
            else{
                industry = industryOfMifi[indexPath.row]
            }
            
            cell.configureCell(industry)
            return cell
            
        } else{
            return UITableViewCell()
        }
         
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var industry: Name!
        if inSearch{
            industry = filteredSearch[indexPath.row]
        }
        else{
            industry = industryOfMifi[indexPath.row]
        }
        performSegueWithIdentifier("NameIndustryPush", sender: industry)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearch{
            return filteredSearch.count
        }
        return industryOfMifi.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //this may need to change when I add more sections
        return 1
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String){
        if searchbar.text == nil || searchbar.text == ""{
            inSearch = false
            view.endEditing(true)
            industryNameTable.reloadData()
        }
        else{
            inSearch = true
            let lower = searchBar.text!
            filteredSearch = industryOfMifi.filter({$0.mifiName.rangeOfString(lower) != nil})
            industryNameTable.reloadData()
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NameIndustryPush"{
            if let detailsVC = segue.destinationViewController as? DetailIndustryVC{
                if let industry = sender as? Industry{
                    
                    detailsVC.industry = industry 
                }
                
            }
        }
    }
    

}