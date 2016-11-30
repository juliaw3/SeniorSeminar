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
    
    @IBOutlet weak var goldbtn: UIButton!
    @IBOutlet weak var silvbtn: UIButton!
    
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
    
    func parseJSON(){
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!
        let task = session.dataTaskWithURL(url, completionHandler: {
            (data, response, error) -> Void in
            if error != nil {
                return
            }
            
            if let jsonResult = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [Dictionary<String, AnyObject>] {
                
                for anItem in jsonResult! {
                    
                    let mifiName2 = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    
                    let newName = Name(mifiName: mifiName2, mifiId: mifiId)
                    self.nameOfMifi.append(newName)
                    //print("Name: \(newName)")
                }
                //Now you need to sort your array on the basis of name like this
                self.nameOfMifi.sortInPlace { $0.mifiName < $1.mifiName }
                
                //Now reload tableView on main thread.
                dispatch_async(dispatch_get_main_queue()) {
                    self.table.reloadData()
                }
            }
        })
        goldbtn.hidden = false
        silvbtn.hidden = true
        task.resume()
    }

    /////////////////////////
    
    @IBAction func favtBtn(sender: AnyObject){
        dispatch_async(dispatch_get_main_queue()) {
            self.nameOfMifi.removeAll()
            self.table.reloadData()
        }
            let session = NSURLSession.sharedSession()
            let url = NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) -> Void in
                if error != nil {
                    return
                }
                
                if let jsonResult = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [Dictionary<String, AnyObject>] {
                    
                    for anItem in jsonResult! {
                        
                        let mifiName2 = anItem["name"] as! String
                        let mifiId = anItem["employeeId"] as! Int
                        let favorite = anItem["favorite"] as! Bool
                        
                        let newName = Name(mifiName: mifiName2, mifiId: mifiId)
                        if favorite == true{
                            self.nameOfMifi.append(newName)
                        }
                        //print("Name: \(newName)")
                    }
                    //Now you need to sort your array on the basis of name like this
                    self.nameOfMifi.sortInPlace { $0.mifiName < $1.mifiName }
                    
                    //Now reload tableView on main thread.
                    dispatch_async(dispatch_get_main_queue()) {
                        self.table.reloadData()
                    }
                }
            })
            goldbtn.hidden = true
            silvbtn.hidden = false
            task.resume()
    }
    
    @IBAction func favtBtn2(sender: AnyObject){
        dispatch_async(dispatch_get_main_queue()) {
            self.nameOfMifi.removeAll()
            self.table.reloadData()
        }
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!
        let task = session.dataTaskWithURL(url, completionHandler: {
            (data, response, error) -> Void in
            if error != nil {
                return
            }
            
            if let jsonResult = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [Dictionary<String, AnyObject>] {
                
                for anItem in jsonResult! {
                    
                    let mifiName2 = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    
                    let newName = Name(mifiName: mifiName2, mifiId: mifiId)
                    self.nameOfMifi.append(newName)
                }
                //Now you need to sort your array on the basis of name like this
                self.nameOfMifi.sortInPlace { $0.mifiName < $1.mifiName }
                
                //Now reload tableView on main thread.
                dispatch_async(dispatch_get_main_queue()) {
                    self.table.reloadData()
                }
            }
        })
        goldbtn.hidden = false
        silvbtn.hidden = true
        task.resume()
    }
    
    
    
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
