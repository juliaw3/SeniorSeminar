//
//  DetailNameVC.swift
//  SeniorSeminar
//
//  Created by Julia Waggoner on 10/1/16.
//  Copyright © 2016 Julia Waggoner. All rights reserved.
//

import UIKit

class DetailNameVC: UIViewController {
    
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
    
    
    var name: Name!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.downloadContactDetails { () -> () in
            self.updateUI()
        }
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateUI(){
        nameLbl.text = name.mifiName
        companyLbl.text = name.company
        industryLbl.text = name.mediaIndustry
        locationLbl.text = name.location
        gradLbl.text = name.gradYear
        descriptionLbl.text = name.description
        housingLbl.text = name.housing
        contactLbl.text = name.contactInfo
        gain1.text = name.skilla
        gain2.text = name.skillb
        gain3.text = name.skillc
        need1.text = name.skill1
        need2.text = name.skill2
        need3.text = name.skill3
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
