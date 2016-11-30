//
//  FavoriteVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 11/29/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//


import UIKit

class FavoriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    
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
        task.resume()
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
    
}