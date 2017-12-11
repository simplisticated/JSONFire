//
//  MainViewController.swift
//  JSONFireDemo
//
//  Created by Igor Matyushkin on 11.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit
import JSONFire

class MainViewController: UIViewController {

    // MARK: Class variables & properties
    
    fileprivate static var unknownIPAddress = "Unknown IP"
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    @IBOutlet fileprivate var currentIPAddressLabel: UILabel!
    
    // MARK: Object variables & properties
    
    fileprivate var request: JSONFire.Request?
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentIPAddressLabel.text = MainViewController.unknownIPAddress
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
    @IBAction internal func refreshButtonDidTap() {
        self.currentIPAddressLabel.text = "Refreshing..."
        
        self.request = JSONFire.request(to: Networking.Services.Ipify.getIP).parsedResponse { (response) in
            if response.error != nil {
                self.currentIPAddressLabel.text = "Status code: \(response.statusCode)"
            } else {
                self.currentIPAddressLabel.text = response.value as? String ?? MainViewController.unknownIPAddress
            }
            
            var text = response.value as? String ?? ""
            
            if text.isEmpty {
                text = "\(((response.error as NSError?)?.code)!)"
            }
        }
    }
    
    // MARK: Protocol implementation
    
}
