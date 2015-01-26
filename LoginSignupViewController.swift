//
//  LoginSignupViewController.swift
//  CommunityChat
//
//  Created by Fei Gao on 1/25/15.
//  Copyright (c) 2015 Fei Gao. All rights reserved.
//

import UIKit

class LoginSignupViewController: PFLogInViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.signUpController.delegate = self
        
        self.logInView.logo = UIImageView(image: UIImage(named:"logo"))
        self.signUpController.signUpView.logo = UIImageView(image: UIImage(named:"logo"))
        
        self.logInView.logo.contentMode = UIViewContentMode.Center
        self.signUpController.signUpView.logo.contentMode = UIViewContentMode.Center
        
        
        if PFUser.currentUser() != nil {
            showChatOverview()
        }
    }
    
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        showChatOverview()
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!) {
        signUpController.dismissViewControllerAnimated(true, completion: { () -> Void in
            self.showChatOverview()
        })
        
    }
    
    func showChatOverview() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let overviewVC = sb.instantiateViewControllerWithIdentifier("ChatOverviewVC") as OverviewTableViewController
        
        overviewVC.navigationItem.setHidesBackButton(true, animated: false)
        
        self.navigationController?.pushViewController(overviewVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
