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
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)

        
    }
    
    func configureCell(company: Company){
        self.company = company
        companyLabel.text = self.company.companyName.capitalizedString
        
    }
    
}