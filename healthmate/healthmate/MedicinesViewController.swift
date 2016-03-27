//
//  MedicinesViewController.swift
//  healthmate
//
//  Created by Aditya Purandare on 27/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class MedicinesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var medicalData: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let patientName = defaults.objectForKey("username")
        let passKey = defaults.objectForKey("password")

        RestClient.sharedInstance.fetchPatientPrescription(["user":patientName!, "pass": passKey!]) { (response, error) in
            if response != nil {
                self.medicalData = response! as! NSDictionary
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let patient = medicalData {
            return patient.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MedicineViewCell", forIndexPath: indexPath) as! MedicineViewCell
        
        let medicine = medicalData![indexPath.row]
        let medicineName = medicine!["medicine"] as! String
        let dosage = medicine!["dosage"] as! String
        
        cell.medicineNameLabel.text = medicineName
        cell.dosageLabel.text = dosage
        
        return cell
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
