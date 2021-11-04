//
//  LoginViewController.swift
//  DAM_M09
//
//  Created by dam on 30/01/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit
import GoogleSignIn
import CoreGraphics

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().presentingViewController = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(LoginViewController.receiveToggleAuthUINotification(_:)),
                                               name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                               object: nil)
    }
    
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        let mainTabBarController = MainTabBarController(nibName:String(describing: MainTabBarController.self), bundle: nil)
        navigationController?.pushViewController(mainTabBarController, animated: true)
    }

}
