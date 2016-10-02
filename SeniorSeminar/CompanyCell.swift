//
//  CompanyCell.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    @IBOutlet weak var companyLabel: UILabel!
    
    var company: Company!
    
    func configureCell(company: Company){
        self.company = company
        companyLabel.text = self.company.companyName.capitalizedString
    }
    
}