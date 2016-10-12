//
//  LocationCell.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/11/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var location: Location!
    
    func configureCell(location: Location){
        self.location = location
        locationLabel.text = self.location.location.capitalizedString
    }
    
}