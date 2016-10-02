//
//  NameCell.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 9/30/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: Name!
    
    func configureCell(name: Name){
        self.name = name
        nameLabel.text = self.name.mifiName.capitalizedString
    }

}
