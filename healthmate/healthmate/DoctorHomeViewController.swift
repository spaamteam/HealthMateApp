//
//  DoctorHomeViewController.swift
//  healthmate
//
//  Created by Aditya Purandare on 26/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class DoctorHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var patients: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        print("Records loaded: \(self.patients!.count)")
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let patients = patients {
            return patients.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PatientsViewCell", forIndexPath: indexPath) as! PatientsViewCell
        
        let patient = patients![indexPath.row]
        let name = patient["name"] as! String
        let severity = patient["flag"] as! String
        
        cell.patientName.text = name
        cell.severity.text = severity

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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? UITableViewCell{
            let indexPath = tableView.indexPathForCell(cell)
            let patient = patients![indexPath!.row]
            print(patient)

            if segue.identifier == "PatientDetailsSegue" {
                let patientDetailsViewController = segue.destinationViewController as! PatientDetailsViewController
                patientDetailsViewController.patient = patient
            }
        }
    }
}
