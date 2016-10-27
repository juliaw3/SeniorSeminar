//
//  LocationDetailAustraliaVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/26/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class LocationDetailAustraliaVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
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
    
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let mifiContinent = anItem["continent"] as! String!
                if mifiContinent == "Australia"{
                    let mifiLocation = anItem["location"] as! String
                    let newLocation = Location(location: mifiLocation)
                    locationOfMifi.append(newLocation)
                }
            }
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
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
        
        performSegueWithIdentifier("USNamePush", sender: location)
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
    
    
}