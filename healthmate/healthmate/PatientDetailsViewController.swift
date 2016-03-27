//
//  PatientDetailsViewController.swift
//  healthmate
//
//  Created by Aditya Purandare on 26/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class PatientDetailsViewController: UIViewController {

    @IBOutlet weak var criticalityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lastVisitLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var prescriptionLabel: UILabel!
    @IBOutlet weak var symptomsLabel: UILabel!
    
    var patient: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RestClient.sharedInstance.fetchPatientDetails(["patient":""]) { (response, error) in
            if response != nil {
                self.patient = response! as NSDictionary
            } else {
                print(error?.localizedDescription)
            }
        }
        nameLabel.text = patient.valueForKeyPath("name") as? String
        criticalityLabel.text = patient.valueForKeyPath("riskflag") as? String
        lastVisitLabel.text = patient.valueForKeyPath("lastvisitdate") as? String
        ageLabel.text = patient.valueForKeyPath("age") as? String
        //historyLabel.text = patient.valueForKeyPath("history") as? String
        symptomsLabel.text = patient.valueForKeyPath("symptom") as? String
        weightLabel.text = patient.valueForKeyPath("weight") as? String
        heightLabel.text = patient.valueForKeyPath("height") as? String
        //prescriptionLabel.text = patient.valueForKeyPath("prescription") as? String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
