//
//  Name.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 9/30/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import Foundation

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
    private var _recommend: Bool!
    private var _contactInfo: String!
    
    var mifiName: String{
        return _mifiName
    }
    var company: String{
        return _company
    }
    var mediaIndustry: String{
        return _mediaIndustry
    }
    var location: String{
        return _location
    }
    var gradYear: String{
        return _gradYear
    }
    var description: String{
        return _description
    }
    var skill1: String{
        return _skill1
    }
    var skill2: String{
        return _skill2
    }
    var skill3: String{
        return _skill3
    }
    var skilla: String{
        return _skilla
    }
    var skillb: String{
        return _skillb
    }
    var skillc: String{
        return _skillc
    }
    var housing: String{
        return _housing
    }
    var recommend: Bool{
        return _recommend
    }
    var contactInfo: String{
        return _contactInfo
    }
    
    init (mifiName: String){
        self._mifiName = mifiName
    }
    
}