//
//  PatientHomeViewController.swift
//  healthmate
//
//  Created by Aditya Purandare on 27/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class PatientHomeViewController: UIViewController {

    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var lastVisitLabel: UILabel!
    @IBOutlet weak var appointmentDateLabel: UILabel!
    @IBOutlet weak var medicinesListLabel: UILabel!
    
    var patient: NSDictionary?
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(patient)
        let patientName = patient!.valueForKeyPath("username") as? String
        doctorNameLabel.text = patient!.valueForKeyPath("doctor") as? String
        lastVisitLabel.text = patient!.valueForKeyPath("lastvisitdate") as? String
        if let scheduledDate = patient!.valueForKeyPath("appointment") as? String {
            appointmentDateLabel.text = scheduledDate
        }
        defaults.setObject(patientName, forKey: "username")
        
        RestClient.sharedInstance.fetchPatientPrescription(["user":patientName!]) { (response, error) in
            if response != nil {
                print("Prescription data: \(response)")
               // medicinesListLabel.text =
            } else {
                print(error?.localizedDescription)
            }
        }
        
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
