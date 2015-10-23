//
//  CardViewController.swift
//  NA
//
//  Created by Alex Taffe on 10/22/15.
//  Copyright © 2015 NA App. All rights reserved.
//

import UIKit

public class CardViewController: UIViewController {
    
    weak public var delegate: CardViewControllerDelegate?
    private var numberOfCards:Int?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        numberOfCards = delegate?.numberOfCards()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
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
