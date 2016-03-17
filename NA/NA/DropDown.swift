//
//  DropDown.swift
//  NA
//
//  Created by Alex on 2/8/16.
//  Copyright © 2016 NA App. All rights reserved.
//

import UIKit

class DropDown: UIView {
    
    var animationDuration = 0.5
    private(set) var isShown = false
    var height:Float?
    var offset = 0
    var masterView:UIViewController?
    private var blurView = UIVisualEffectView(effect: UIBlurEffect())
    private var addedView:UIView?
    var view:UIView?{
        get{
            return addedView
        }
        set(newValue){
            addedView = nil
            self.addSubview(newValue!)
            addedView = newValue
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(){
        if height == nil{
            //throw
        }
        if masterView == nil{
            //throw
        }
        isShown = true
        masterView?.view.addSubview(self)
        self.layer.zPosition = 100
        self.addedView!.frame = CGRectMake(0, (masterView?.navigationController?.navigationBar.frame.maxY)!, UIScreen.mainScreen().bounds.size.width, 0)
        UIView.animateWithDuration(0.48, delay: 0, options: .CurveEaseIn, animations: {
            self.addedView!.frame = CGRectMake(0, (self.masterView?.navigationController?.navigationBar.frame.maxY)!, UIScreen.mainScreen().bounds.size.width, CGFloat(self.height!))
            }, completion: nil)
        
        
    }
    func hide(){
        isShown = false
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

enum DropDownDirection{
    case Up,Down
}