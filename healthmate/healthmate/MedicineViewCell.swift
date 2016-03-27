//
//  MedicineViewCell.swift
//  healthmate
//
//  Created by Aditya Purandare on 27/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class MedicineViewCell: UITableViewCell {

    @IBOutlet weak var medicineNameLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
