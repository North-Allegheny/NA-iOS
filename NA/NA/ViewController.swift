//
//  ViewController.swift
//  NA
//
//  Created by Taffe, Alexander on 1/12/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if isLoggedIn(){
            performSegueWithIdentifier(<#identifier: String#>, sender: <#AnyObject?#>)
        }
        else{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //HI GUYS
    }
    func isLoggedIn()->Bool{
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

}

