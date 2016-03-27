//
//  LoginViewController.swift
//  healthmate
//
//  Created by Aditya Purandare on 26/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var patientResponse: NSDictionary?
    var doctorResponse: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //RestClient.sharedInstance.loginWithCompletion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPatientLogin(sender: AnyObject) {
        RestClient.sharedInstance.fetchPatientDetails(["user":usernameTextField.text!, "pass": passwordTextField.text!], completion: { (response, error) in
            
                if response != nil {
                    // Set NSUSerDefaults
                    self.patientResponse = response! as NSDictionary
                    self.performSegueWithIdentifier("PatientLoginSegue", sender: self)
                } else {
                    let alert = UIAlertController(title: nil, message: "Login Failed", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
                    self.presentViewController(alert,animated: true,completion: nil)

                    print(error?.localizedDescription)
                }
        })
        
    }

    @IBAction func onDoctorLogin(sender: AnyObject) {
        RestClient.sharedInstance.fetchPatientsForDoctor(["user":usernameTextField.text!, "pass": passwordTextField.text!], completion: { (response, error) in
            
            if response != nil {
                // Set NSUSerDefaults
                self.doctorResponse = response! as [NSDictionary]
                self.performSegueWithIdentifier("DoctorLoginSegue", sender: self)
            } else {
                let alert = UIAlertController(title: nil, message: "Login Failed", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
                self.presentViewController(alert,animated: true,completion: nil)
                
                print(error?.localizedDescription)
            }
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PatientLoginSegue" {
            
            let tabBarController = segue.destinationViewController as! UITabBarController
            let patientHomeViewController = tabBarController.viewControllers![0] as! PatientHomeViewController
            patientHomeViewController.patient = self.patientResponse
        } else if segue.identifier == "DoctorLoginSegue" {
            let tabBarController = segue.destinationViewController as! UITabBarController
            let navController = tabBarController.viewControllers![0] as! UINavigationController
            let doctorHomeViewController = navController.topViewController as! DoctorHomeViewController
            doctorHomeViewController.patients = self.doctorResponse
        }
    }

}
