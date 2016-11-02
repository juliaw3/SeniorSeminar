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
    
    var filteredSearch = [Industry]()
    var industryOfMifi = [Industry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        industryNameTable.delegate = self
        industryNameTable.dataSource = self
        searchbar.delegate = self 
        searchbar.returnKeyType = UIReturnKeyType.Done
        
        parseJSON()
    }
    
    func parseJSON(){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                let mifiIndustry = anItem["mediaIndustry"] as! String!
                if mifiIndustry == "Newspaper"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Magazine"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Television"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Film"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Radio"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Social Media"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Public Relations"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Marketing"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Publishing"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Interactive Media"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
                else if mifiIndustry == "Other"{
                    let mediaIndustry = anItem["name"] as! String
                    let mifiId = anItem["employeeId"] as! Int
                    let newContact = Industry(industryName: mediaIndustry, mifiId: mifiId)
                    industryOfMifi.append(newContact)
                }
            }
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
    }
    
    
    @IBAction func BtnPressed(sender: AnyObject) {
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
            filteredSearch = industryOfMifi.filter({$0.industryName.rangeOfString(lower) != nil})
            industryNameTable.reloadData()
            
        }
    }
    

}