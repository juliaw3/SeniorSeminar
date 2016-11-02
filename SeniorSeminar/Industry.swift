//
//  Industry.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import Foundation

class Industry{
    //add any additional fields in this same way... all will need to be declared with
    //private, accessed with a var/return statement, and initalized if it is a required field
    private var _industryName: String!
    private var _employeeId: Int!
    
    var industryName: String{
        return _industryName
    }
    var employeeId: Int{
        return _employeeId
    }
    
    init (industryName: String, mifiId: Int){
        self._industryName = industryName
        self._employeeId = mifiId
    }
}