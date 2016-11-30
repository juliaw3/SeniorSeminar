//
//  IndustryViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class IndustryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var table3: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var industryOfMifi = [Industry]()
    
    var inSearch = false
    var filteredSearch = [Industry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table3.delegate = self
        table3.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.Done
        
        parseJSON()
    }
    
    ////////////////
    //parse the main JSON for the main view controller
    
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            var industrySet = Set<String>()
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let mifiIndustry2 = anItem["mediaIndustry"] as! String
                let mifiId = anItem["employeeId"] as! Int
                
                if !(industrySet.contains(mifiIndustry2)){
                    industrySet.insert(mifiIndustry2)
                    
                    let newIndustry = Industry(industryName: mifiIndustry2, mifiId: mifiId)
                    industryOfMifi.append(newIndustry)
                }
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
        var industry: Industry!
        
        if inSearch{
            industry = filteredSearch[indexPath.row]
        }
        else{
            industry = industryOfMifi[indexPath.row]
        }
        performSegueWithIdentifier("IndustryPush", sender: industry)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearch{
            return filteredSearch.count
        }
        return 11
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
            table3.reloadData()
        }
        else{
            inSearch = true
            let lower = searchBar.text!
            filteredSearch = industryOfMifi.filter({$0.mediaIndustry.rangeOfString(lower) != nil})
            table3.reloadData()
            
        }
    }
    //try putting if statements here. if the newspaper button is pressed, perform segue with NewsPush
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "IndustryPush"{
            if let detailsVC = segue.destinationViewController as? IndustryDetailVC{
                if let industry = sender as? Industry{
                    
                    detailsVC.industry = industry
                }
                
            }
        }
    }
    
}






