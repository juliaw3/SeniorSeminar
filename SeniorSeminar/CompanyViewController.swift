//
//  CompanyViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var table2: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
   
    var inSearch = false
    var filteredSearch = [Company]()
    
     var companyOfMifi = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table2.delegate = self
        table2.dataSource = self
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
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let companyName2 = anItem["company"] as! String
                let mifiId = anItem["employeeId"] as! Int
                
                let newCompany = Company(companyName: companyName2, mifiId: mifiId)
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
            if inSearch{
                company = filteredSearch[indexPath.row]
            }
            else{
                company = companyOfMifi[indexPath.row]
            }
            
            cell.configureCell(company)
            return cell
            
        } else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var company: Company!
        
        if inSearch{
            company = filteredSearch[indexPath.row]
        }
        else{
            company = companyOfMifi[indexPath.row]
        }
        
        performSegueWithIdentifier("CompanyPush", sender: company)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearch{
            return filteredSearch.count
        }
        return companyOfMifi.count
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
            table2.reloadData()
        }
        else{
            inSearch = true
            let lower = searchBar.text!
            filteredSearch = companyOfMifi.filter({$0.companyName.rangeOfString(lower) != nil})
            table2.reloadData()
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CompanyPush"{
            if let detailsVC = segue.destinationViewController as? DetailNameVC{
                if let company = sender as? Company{
                    detailsVC.company = company
                }
            }
        }
    }

}
