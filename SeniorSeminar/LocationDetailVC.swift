//
//  LocationDetailVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/11/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class LocationDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var locationTable: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var inSearch = false
    var filteredSearch = [Location]()
    
    var locationOfMifi = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTable.delegate = self
        locationTable.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.Done
        
        parseJSON()
    }
/*
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let mifiContinent = anItem["continent"] as! String!
                if mifiContinent == "US"{
                    let mifiLocation = anItem["location"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newLocation = Location(location: mifiLocation, mifiId: mifiId)
                    locationOfMifi.append(newLocation)
                }
            }
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
    }
*/
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
                    
                    let mifiContinent = anItem["continent"] as! String
                    if mifiContinent == "US"{
                        let mifiLocation = anItem["location"] as! String
                        let mifiId = anItem["employeeId"] as! Int
                        let newLocation = Location(location: mifiLocation, mifiId: mifiId)
                        self.locationOfMifi.append(newLocation)
                    }
                    
                    
                }
                //Now you need to sort your array on the basis of name like this
                self.locationOfMifi.sortInPlace { $0.location < $1.location }
                
                //Now reload tableView on main thread.
                dispatch_async(dispatch_get_main_queue()) {
                    self.locationTable.reloadData()
                }
            }
        })
        task.resume()
    }
        
     
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath)as? LocationCell{
            
            let location: Location!
            
            if inSearch{
                location = filteredSearch[indexPath.row]
            }
            else{
                location = locationOfMifi[indexPath.row]
            }
            
            cell.configureCell(location)
            return cell
            
            
        } else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var location: Location!
        
        if inSearch{
            location = filteredSearch[indexPath.row]
        }
        else{
            location = locationOfMifi[indexPath.row]
        }
        
        performSegueWithIdentifier("LocationPush", sender: location)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearch{
            return filteredSearch.count
        }
        return locationOfMifi.count
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String){
        if searchbar.text == nil || searchbar.text == ""{
            inSearch = false
            view.endEditing(true)
            locationTable.reloadData()
        }
        else{
            inSearch = true
            let lower = searchBar.text!
            filteredSearch = locationOfMifi.filter({$0.location.rangeOfString(lower) != nil})
            locationTable.reloadData()
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LocationPush"{
            if let detailsVC = segue.destinationViewController as? DetailLocationVC{
                if let location = sender as? Location{
                    detailsVC.location = location
                }
            }
        }
    }
    
    
}