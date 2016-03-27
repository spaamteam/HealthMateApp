//
//  SymptomViewCell.swift
//  healthmate
//
//  Created by Aditya Purandare on 27/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class SymptomViewCell: UITableViewCell {

    @IBOutlet weak var symptomLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
