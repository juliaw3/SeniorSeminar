//
//  NameViewController.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var inSearch = false
    var filteredSearch = [Name]()
    
    var nameOfMifi = [Name]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
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
                
                let mifiName2 = anItem["name"] as! String
                let mifiId = anItem["employeeId"] as! Int
                
                let newName = Name(mifiName: mifiName2, mifiId: mifiId)
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
            
            if inSearch{
                name = filteredSearch[indexPath.row]
            }
            else{
                name = nameOfMifi[indexPath.row]
            }
            
            cell.configureCell(name)
            return cell
            
        } else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var name: Name!
        
        if inSearch{
            name = filteredSearch[indexPath.row]
        }
        else{
            name = nameOfMifi[indexPath.row]
        }
        
        print(name.mifiName)
        performSegueWithIdentifier("NamePush", sender: name)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearch{
            return filteredSearch.count
        }
        return nameOfMifi.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String){
        if searchbar.text == nil || searchbar.text == ""{
            inSearch = false
            view.endEditing(true)
            table.reloadData()
        }
        else{
            inSearch = true
            let lower = searchBar.text!
            filteredSearch = nameOfMifi.filter({$0.mifiName.rangeOfString(lower) != nil})
            table.reloadData()
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NamePush"{
            if let detailsVC = segue.destinationViewController as? DetailNameVC{
                if let name = sender as? Name{
                    detailsVC.name = name
                }
            }
        }
    }

}
