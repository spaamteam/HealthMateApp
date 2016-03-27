//
//  RestClient.swift
//  healthmate
//
//  Created by Aditya Purandare on 26/03/16.
//  Copyright © 2016 Aditya Purandare. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let baseRestURL = NSURL(string: "http://thecompanion.herokuapp.com")

class RestClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: RestClient {
        struct Static {
            static let instance = RestClient(baseURL: baseRestURL)
        }
        return Static.instance
        }
        
    func createNewUser(params: NSDictionary?, completion: (success: Bool?, error: NSError?) -> ()) {
        
            RestClient.sharedInstance.POST("create_user", parameters: params, progress: nil, success: { (operation: NSURLSessionDataTask, response: AnyObject?) in
                
                completion(success: true, error: nil)
                
                }, failure: { (operation: NSURLSessionDataTask?, error: NSError) in
                    print("error getting current user: \(error)")
                    completion(success: false, error: error)
            })
            
        }
    
    func fetchPatientsForDoctor(params: NSDictionary?, completion: (response: NSDictionary?, error: NSError?) -> ()) {
        
        RestClient.sharedInstance.POST("doctor_login", parameters: params, progress: nil, success: { (operation: NSURLSessionDataTask, response: AnyObject?) in
                        
            completion(response: response as? NSDictionary, error: nil)
            
            }, failure: { (operation: NSURLSessionDataTask?, error: NSError) in
                print("error getting current user: \(error)")
                completion(response: nil, error: error)
        })
        
    }
    
//        func sendNewTweet(params: NSDictionary?, completion: (response: NSDictionary?,error: NSError?)->()) {
//            TwitterClient.sharedInstance.POST("1.1/statuses/update.json", parameters: params, progress: nil, success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
//                completion(response: response as? NSDictionary, error: nil)
//            }) { (operation: NSURLSessionDataTask?, error: NSError) -> Void in
//                completion(response: nil, error: error)
//            }
//        }
    
}
