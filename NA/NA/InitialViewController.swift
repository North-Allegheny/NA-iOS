//
//  ViewController.swift
//  NA
//
//  Created by Taffe, Alexander on 1/12/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        if isLoggedIn(){
            performSegueWithIdentifier("isLoggedIn", sender: self)
        }
        else{
            performSegueWithIdentifier("login", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isLoggedIn()->Bool{
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    @IBAction func teacherStudentLogin(sender: AnyObject) {
        //perform login here
    }
    


}

