//
//  Name.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 9/30/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//


import Foundation
import Alamofire

class Name{
    //add any additional fields in this same way... all will need to be declared with 
    //private, accessed with a var/return statement, and initalized if it is a required field
    private var _mifiName: String!
    private var _company: String!
    private var _mediaIndustry: String!
    private var _location: String!
    private var _gradYear: String!
    private var _description: String!
    private var _skill1: String!
    private var _skill2: String!
    private var _skill3: String!
    private var _skilla: String!
    private var _skillb: String!
    private var _skillc: String!
    private var _housing: String!
    //private var _recommend: Bool!
    private var _contactInfo: String!
    private var _employeeId: Int!
    
    var employeeId: Int{
        return _employeeId
    }
    
    var mifiName: String{
        if _mifiName == nil{
            _mifiName = ""
        }
        return _mifiName
    }
    var company: String{
        if _company == nil{
            _company = ""
        }
        return _company
    }
    var mediaIndustry: String{
        if _mediaIndustry == nil{
            _mediaIndustry = ""
        }
        return _mediaIndustry
    }
    var location: String{
        if _location == nil{
            _location = ""
        }
        return _location
    }
    var gradYear: String{
        if _gradYear == nil{
            _gradYear = ""
        }
        return _gradYear
    }
    
    var description: String{
        if _description == nil{
            _description = ""
        }
        return _description
    }
    
    var skill1: String{
        if _skill1 == nil{
            _skill1 = ""
        }
        return _skill1
    }
    
    var skill2: String{
        if _skill2 == nil{
            _skill2 = ""
        }
        return _skill2
    }
    
    var skill3: String{
        if _skill3 == nil{
            _skill3 = ""
        }
        return _skill3
    }
    
    var skilla: String{
        if _skilla == nil{
            _skilla = ""
        }
        return _skilla
    }
    
    var skillb: String{
        if _skillb == nil{
            _skillb = ""
        }
        return _skillb
    }
    
    var skillc: String{
        if _skillc == nil{
            _skillc = ""
        }
        return _skillc
    }
    
    var housing: String{
        if _housing == nil{
            _housing = ""
        }
        return _housing
    }
    /*
    var recommend: Bool{
        return _recommend
    }
*/
    var contactInfo: String{
        if _contactInfo == nil{
            _contactInfo = ""
        }
        return _contactInfo
    }
    
    init (mifiName: String, mifiId: Int){
        self._mifiName = mifiName
        self._employeeId = mifiId
    }
    
    
    //parse the JSON using Alamofire
    func downloadContactDetails(completed: DownloadComplete){
        let url = NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!
        Alamofire.request(.GET, url).responseJSON{response in
            let result = response.result
            
            print(result.value.debugDescription)
            
            
            if let dict = result.value as? [Dictionary<String, AnyObject>]{
                if let name = dict[self.employeeId - 1]["name"] as? String{
                    self._mifiName = name
                }
                if let mediaIndustry = dict[self.employeeId - 1]["mediaIndustry"] as? String{
                    self._mediaIndustry = mediaIndustry
                }
                if let company = dict[self.employeeId - 1]["company"] as? String{
                    self._company = company
                }
                if let location = dict[self.employeeId - 1]["location"] as? String{
                    self._location = location
                }
                if let gradYear = dict[self.employeeId - 1]["graduationYear"] as? String{
                    self._gradYear = gradYear
                }
                if let description = dict[self.employeeId - 1]["description"] as? String{
                    self._description = description
                }
                if let housing = dict[self.employeeId - 1]["housing"] as? String{
                    self._housing = housing
                }
                if let contactInfo = dict[self.employeeId - 1]["email"] as? String{
                    self._contactInfo = contactInfo
                }
                
                if let needSkills = dict[self.employeeId - 1]["skillsNeeded"] as? Dictionary<String, AnyObject>{
                    if let need1 = needSkills["needed1"] as? String{
                        self._skill1 = need1
                    }
                    if let need2 = needSkills["needed2"] as? String{
                        self._skill2 = need2
                    }
                    if let need3 = needSkills["needed3"] as? String{
                        self._skill3 = need3
                    }
                }
                
                if let gainSkills = dict[self.employeeId - 1]["skillsGained"] as? Dictionary<String, AnyObject>{
                    if let gain1 = gainSkills["gained1"] as? String{
                        self._skilla = gain1
                    }
                    if let gain2 = gainSkills["gained2"] as? String{
                        self._skillb = gain2
                    }
                    if let gain3 = gainSkills["gained3"] as? String{
                        self._skillc = gain3
                    }
                }
                
            }
            completed()

    }

   /*
    
    //PLEASE WORK :) instead of using Alamofire... I am hoping parsing the JSON this way will also work on the detail pages
    func parseMainJSON(completed: DownloadComplete){
        do{
            let data = NSData(contentsOfURL: NSURL(string: "https://jsonblob.com/api/jsonBlob/580d0ccce4b0bcac9f837fbe")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>]{
                
                if let name = anItem["name"] as? String{
                    self._mifiName = name
                }
                if let company = anItem["company"] as? String{
                    self._company = company
                }
                if let mediaIndustry = anItem["mediaIndustry"] as? String{
                    self._mediaIndustry = mediaIndustry
                }
                if let location = anItem["mediaIndustry"] as? String{
                    self._location = location
                }
                if let gradYear = anItem["graduationYear"] as? String{
                    self._gradYear = gradYear
                }
                if let description = anItem["description"] as? String{
                    self._description = description
                }
                if let housing = anItem["mediaIndustry"] as? String{
                    self._housing = housing
                }
                if let contactInfo = anItem["email"] as? String{
                    self._contactInfo = contactInfo
                }
                if let skill1 = anItem["needed1"] as? String{
                    self._skill1 = skill1
                }
                if let skill2 = anItem["needed2"] as? String{
                    self._skill2 = skill2
                }
                if let skill3 = anItem["needed3"] as? String{
                    self._skill3 = skill3
                }
                if let skilla = anItem["gained1"] as? String{
                    self._skilla = skilla
                }
                if let skillb = anItem["gainedb"] as? String{
                    self._skillb = skillb
                }
                if let skillc = anItem["gainedc"] as? String{
                    self._skillc = skillc
                }
                
            }
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
    }
*/

    }
}






