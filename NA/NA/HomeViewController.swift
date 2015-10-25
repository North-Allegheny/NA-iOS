//
//  HomeViewController.swift
//  NA
//
//  Created by Alex Taffe on 10/22/15.
//  Copyright © 2015 NA App. All rights reserved.
//

import UIKit

class HomeViewController: CardViewController, CardViewControllerDelegate {
    
    let cardTitles = ["Announcements","Assignments","Calendar"]

    override func viewDidLoad() {
        self.delegate = self
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfCards()->Int{
        return 3
    }
    
    func cardForIndex(index: Int) -> CardView {
        let card = CardView()
        
        card.backgroundColor = UIColor(red: 0.082, green: 0.082, blue: 0.082, alpha: 1)
        card.title = cardTitles[index]
        card.titleColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:1.0)
        card.titleBackgroundColor = UIColor(red:0.83, green:0.80, blue:0.27, alpha:1.0)
        card.textLines = ["First","Second"]
        
        return card
    }
    func backgroundColor() -> UIColor {
        return UIColor(red: 0.114, green: 0.114, blue: 0.114, alpha: 1)
    }
    func useLightScrollBar() -> Bool {
        return true
    }
    
    func headerView() -> HomeHeaderView {
        let headerView = NSBundle.mainBundle().loadNibNamed("HomeHeader", owner: nil, options: nil)[0] as! HomeHeaderView
        return headerView
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