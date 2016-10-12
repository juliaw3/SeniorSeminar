//
//  Location.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/11/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import Foundation

class Location{
    //add any additional fields in this same way... all will need to be declared with
    //private, accessed with a var/return statement, and initalized if it is a required field
    private var _Location: String!
    
    var location: String{
        return _Location
    }
    
    init (location: String){
        self._Location = location
    }
}