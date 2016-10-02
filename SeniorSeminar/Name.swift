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
    
    var mifiName: String{
        return _mifiName
    }
    
    init (mifiName: String){
        self._mifiName = mifiName
    }
}