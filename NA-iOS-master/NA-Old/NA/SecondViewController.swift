//
//  SecondViewController.swift
//  NA
//
//  Created by Alex Taffe on 4/17/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func showMenu(sender: AnyObject) {
        //dismiss the keyboard
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        //show the menu
        self.frostedViewController.presentMenuViewController()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
