//
//  PatientsViewCell.swift
//  healthmate
//
//  Created by Aditya Purandare on 26/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class PatientsViewCell: UITableViewCell {

    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var severity: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
