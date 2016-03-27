//
//  NewPatientViewController.swift
//  healthmate
//
//  Created by Aditya Purandare on 26/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class NewPatientViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var DOBLabel: UITextField!
    @IBOutlet weak var genderLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var heightLabel: UITextField!
    @IBOutlet weak var weightLabel: UITextField!
    @IBOutlet weak var illnessLabel: UITextField!
    @IBOutlet weak var severityLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addPatient(sender: AnyObject) {
        

//        let user: NSDictionary = ["user": "audi", "pass": "audi", "name": "hello", "DOB": "12-12-2014", "gender": "male", "phone": "9799857141", "height": "167", "weight": "160"]
        
        let user: NSDictionary = ["user": "\(usernameLabel.text!)", "pass": "\(passwordLabel.text!)", "name": "\(nameLabel.text!)", "DOB": "\(DOBLabel.text!)", "gender": "\(genderLabel.text!)", "phone": "\(phoneLabel.text!)", "height": "\(heightLabel.text!)", "weight": "\(weightLabel.text!)", "doctor": "saddamhussain@gmail.com"]
        
        
        RestClient.sharedInstance.createNewUser(user) { (success, error) in
            if success == true {
                print("Created new user")
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
