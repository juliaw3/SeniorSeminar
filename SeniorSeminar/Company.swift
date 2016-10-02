//
//  Company.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import Foundation

class Company{
    //add any additional fields in this same way... all will need to be declared with
    //private, accessed with a var/return statement, and initalized if it is a required field
    private var _companyName: String!
    
    var companyName: String{
        return _companyName
    }
    
    init (company: String){
        self._companyName = companyName
    }
}