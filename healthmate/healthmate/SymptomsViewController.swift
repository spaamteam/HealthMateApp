//
//  SymptomsViewController.swift
//  healthmate
//
//  Created by Aditya Purandare on 27/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class SymptomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var medicalData: NSDictionary!
    var sym: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let patientName = defaults.objectForKey("username")
        
        RestClient.sharedInstance.fetchPatient(["user":patientName!]) { (response, error) in
            if response != nil {
                print("Prescription data: \(response)")
                self.medicalData = response! as NSDictionary
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
        for (key,value) in medicalData {
            if key as! String == "symptomname" {
                self.sym.addObject(value)
                print(value)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let patients = medicalData {
            return patients.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SymptomViewCell", forIndexPath: indexPath) as! SymptomViewCell
        
        let symptom = medicalData![indexPath.row]
        let symptoms = symptom!["symptoms"] as! NSDictionary
        
        cell.symptomLabel.text = symptoms["symptomname"] as! String
        
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
