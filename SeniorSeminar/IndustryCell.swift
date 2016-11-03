//
//  IndustryCell.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class IndustryCell: UITableViewCell {
    
    @IBOutlet weak var industryLabel: UILabel!
    
    var industry: Industry!
    
    func configureCell(industry: Industry){
        self.industry = industry
        industryLabel.text = self.industry.mediaIndustry.capitalizedString
    }
    
}