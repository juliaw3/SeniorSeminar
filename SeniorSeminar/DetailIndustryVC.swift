//
//  DetailIndustryVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 11/2/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class DetailIndustryVC: UIViewController {

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
    
    
    var industry: Industry!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        industry.downloadContactDetails { () -> () in
            self.updateUI()
        }
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateUI(){
        nameLbl.text = industry.mifiName
        companyLbl.text = industry.company
        industryLbl.text = industry.mediaIndustry
        locationLbl.text = industry.location
        gradLbl.text = industry.gradYear
        descriptionLbl.text = industry.description
        housingLbl.text = industry.housing
        contactLbl.text = industry.contactInfo
        gain1.text = industry.skilla
        gain2.text = industry.skillb
        gain3.text = industry.skillc
        need1.text = industry.skill1
        need2.text = industry.skill2
        need3.text = industry.skill3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}