//
//  StateDetailTableViewCell.swift
//  Representative
//
//  Created by Zebadiah Watson on 10/2/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateDetailTableViewCell: UITableViewCell {
    
    //outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    

    func updateViews() {
        guard let representative = representative else {
            print("No representative for cell.")
            return
        }
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        phoneLabel.text = representative.phone
        
    }

}
