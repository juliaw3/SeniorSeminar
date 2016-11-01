//
//  DetailLocationVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 11/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class DetailLocationVC: UIViewController {
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
    
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location.downloadContactDetails { () -> () in
            self.updateUI()
        }
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateUI(){
        nameLbl.text = location.mifiName
        companyLbl.text = location.company
        industryLbl.text = location.mediaIndustry
        locationLbl.text = location.location
        gradLbl.text = location.gradYear
        descriptionLbl.text = location.description
        housingLbl.text = location.housing
        contactLbl.text = location.contactInfo
        gain1.text = location.skilla
        gain2.text = location.skillb
        gain3.text = location.skillc
        need1.text = location.skill1
        need2.text = location.skill2
        need3.text = location.skill3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
