//
//  GradesViewController.swift
//  NA
//
//  Created by Alex on 1/30/16.
//  Copyright © 2016 NA App. All rights reserved.
//

import UIKit

class GradesViewController: CardViewController, CardViewControllerDelegate {

    let dropDown = DropDown()
    @IBAction func showDropDown(sender: AnyObject) {
        if dropDown.isShown{
            dropDown.hide()
        }
        else{
            dropDown.show()
        }
    }
    override func viewDidLoad() {
        self.delegate = self
        super.viewDidLoad()
        dropDown.masterView = self
        dropDown.view = UIView.loadFromNibNamed("GradeFilterView")
        dropDown.height = 200
        
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
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
        card.title = "test"
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}
