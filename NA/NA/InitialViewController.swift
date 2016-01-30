//
//  InitialViewController.swift
//  NA
//
//  Created by Alex Taffe on 10/5/15.
//  Copyright © 2015 NA App. All rights reserved.
//

import UIKit
import QuartzCore

class InitialViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var instructionText: UITextView!
    @IBOutlet var googleLoginButtonView: GIDSignInButton!
    @IBOutlet var tylerLoginButton: UIButton!
    @IBOutlet var blackboardLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //connect google button
        GIDSignIn.sharedInstance().uiDelegate = self
        
        //auto Google sign in if possible
        GIDSignIn.sharedInstance().signInSilently()
        
        tylerLoginButton.layer.cornerRadius = 2
        tylerLoginButton.layer.masksToBounds = false
        tylerLoginButton.layer.borderWidth = 1
        tylerLoginButton.layer.shadowColor = UIColor(red:0.62, green:0.62, blue:0.62, alpha:1).CGColor
        tylerLoginButton.layer.shadowOpacity = 0.8
        tylerLoginButton.layer.shadowRadius = 1
        tylerLoginButton.layer.shadowOffset = CGSizeMake(0, 2)
        tylerLoginButton.backgroundColor = UIColor.whiteColor()
        tylerLoginButton.tintColor = UIColor.whiteColor()
        tylerLoginButton.layer.borderColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1).CGColor
        let tylerLabel = UILabel()
        tylerLabel.text = "Sign in"
        tylerLabel.font = UIFont(name: "Roboto", size: 14)
        tylerLabel.textColor = UIColor(red:0.46, green:0.46, blue:0.46, alpha:1)
        tylerLabel.sizeToFit()
        tylerLabel.frame = blackboardLoginButton.bounds
        tylerLabel.frame = CGRectMake(tylerLabel.frame.minX + 50, tylerLabel.frame.minY - 5, tylerLabel.frame.width, tylerLabel.frame.height)
        tylerLoginButton.addSubview(tylerLabel)
        
        blackboardLoginButton.layer.cornerRadius = 2
        blackboardLoginButton.layer.masksToBounds = false
        blackboardLoginButton.layer.borderWidth = 1
        blackboardLoginButton.layer.shadowColor = UIColor(red:0.62, green:0.62, blue:0.62, alpha:1).CGColor
        blackboardLoginButton.layer.shadowOpacity = 0.8
        blackboardLoginButton.layer.shadowRadius = 1
        blackboardLoginButton.layer.shadowOffset = CGSizeMake(0, 2)
        blackboardLoginButton.backgroundColor = UIColor.whiteColor()
        blackboardLoginButton.tintColor = UIColor.whiteColor()
        blackboardLoginButton.layer.borderColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1).CGColor
        let blackBoardLabel = UILabel()
        blackBoardLabel.text = "Sign in"
        blackBoardLabel.font = UIFont(name: "Roboto", size: 14)
        blackBoardLabel.textColor = UIColor(red:0.46, green:0.46, blue:0.46, alpha:1)
        blackBoardLabel.sizeToFit()
        blackBoardLabel.frame = blackboardLoginButton.bounds
        blackBoardLabel.frame = CGRectMake(blackBoardLabel.frame.minX + 50, blackBoardLabel.frame.minY - 5, blackBoardLabel.frame.width, blackBoardLabel.frame.height)
        blackboardLoginButton.addSubview(blackBoardLabel)
        
        let blackboardImage = UIImage(named: "Black Board Logo")
        blackboardLoginButton.setImage(blackboardImage, forState: .Normal)
        blackboardLoginButton.contentMode = .ScaleAspectFit
        blackboardLoginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -155, bottom: 0, right: 0)
        blackboardLoginButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let tylerImage = UIImage(named: "Tyler Logo")
        tylerLoginButton.setImage(tylerImage, forState: .Normal)
        tylerLoginButton.contentMode = .ScaleAspectFit
        tylerLoginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -155, bottom: 0, right: 0)
        tylerLoginButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        instructionText.alpha = 0.0
        tylerLoginButton.alpha = 0.0
        blackboardLoginButton.alpha = 0.0
        googleLoginButtonView.alpha = 0.0
        let instructions:NSMutableAttributedString = NSMutableAttributedString(string: "Welcome\n\nTo begin, please sign in to your Google Apps, Tyler SIS, and Blackboard accounts.")
        instructions.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(23), range: NSRange(location: 0,length: 7))
        instructions.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(20), range: NSRange(location: 8,length: instructions.length - 1 - 7))
        instructionText.attributedText = instructions
        instructionText.textAlignment = NSTextAlignment.Center

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //insert into variables
        let logoWidth = logoImage.frame.size.width * (4/3)
        let logoHeight = logoImage.frame.size.height * (4/3)
        let newX = self.logoImage.frame.minX - (logoWidth - logoImage.frame.size.width) / 2
        //status bar+navigation bar
        let newY = UIApplication.sharedApplication().statusBarFrame.size.height - 20
        
        //animate the logo
        UIView.animateWithDuration(1.0, delay:0.02, options: .CurveEaseIn, animations: {
            self.logoImage.frame = CGRectMake(newX, newY, logoWidth, logoHeight)
            }, completion: nil)
        //animate the text and button with a slight delay, but same overall time
        UIView.animateWithDuration(0.48, delay: 0.5, options: .CurveEaseIn, animations: {
            self.instructionText.alpha = 1.0
            self.googleLoginButtonView.alpha = 1.0
            self.blackboardLoginButton.alpha = 1.0
            self.tylerLoginButton.alpha = 1.0
            }, completion: nil)
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
