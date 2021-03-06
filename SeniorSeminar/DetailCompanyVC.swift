//
//  DetailCompanyVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 11/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class DetailCompanyVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var industryLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var gradLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var housingLbl: UILabel!
    @IBOutlet weak var contactLbl: UILabel!
    @IBOutlet weak var gain1: UILabel!
    @IBOutlet weak var gain2: UILabel!
    @IBOutlet weak var gain3: UILabel!
    @IBOutlet weak var need1: UILabel!
    @IBOutlet weak var need2: UILabel!
    @IBOutlet weak var need3: UILabel!
    
    var company: Company!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        company.downloadContactDetails2 { () -> () in
            self.updateUI()
        }
        
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateUI(){
        nameLbl.text = company.mifiName
        companyLbl.text = company.companyName
        industryLbl.text = company.mediaIndustry
        locationLbl.text = company.location
        gradLbl.text = company.gradYear
        descriptionLbl.text = company.description
        housingLbl.text = company.housing
        contactLbl.text = company.contactInfo
        gain1.text = company.skilla
        gain2.text = company.skillb
        gain3.text = company.skillc
        need1.text = company.skill1
        need2.text = company.skill2
        need3.text = company.skill3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
