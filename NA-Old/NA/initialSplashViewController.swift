
//
//  initialSplashViewController.swift
//  NA
//
//  Created by Joshua Thomas on 4/20/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class initialSplashViewController: UIViewController {
    func isLoggedIn()->Bool{
        return false
    }
    override func viewDidAppear(animated: Bool) {
        if !isLoggedIn(){
            self.performSegueWithIdentifier("setup", sender: self)
        }
        else{
            self.performSegueWithIdentifier("run", sender: self)
        }
        // Do any additional setup after loading the view.
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
