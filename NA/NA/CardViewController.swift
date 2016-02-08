//
//  CardViewController.swift
//  NA
//
//  Created by Alex Taffe on 10/22/15.
//  Copyright © 2015 NA App. All rights reserved.
//

import UIKit
import FXBlurView

public class CardViewController: UIViewController, UIScrollViewDelegate {
    
    weak public var delegate: CardViewControllerDelegate?
    private var numberOfCards:Int!
    private var cards:[CardView]!
    private var cardScrollView:UIScrollView!
    private var cardSpacing:Float!
    private var headerView:HomeHeaderView?
    private var blurHeaderImageView:UIImageView!
    private var originalHeaderHeight:CGFloat?
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        //if(scrollView.contentOffset.y < headerView?.frame.height){
        blurHeaderImageView?.alpha = scrollView.contentOffset.y / 10
        
        if originalHeaderHeight == nil{
            originalHeaderHeight = headerView?.frame.height
        }
        
        if headerView != nil{
        scrollView.frame = CGRect(x: 0, y: headerView!.frame.maxY - scrollView.contentOffset.y, width: headerView!.frame.width, height: originalHeaderHeight! + scrollView.contentOffset.y)
        blurHeaderImageView.frame = CGRect(x: 0, y: 0, width: blurHeaderImageView.frame.width, height: originalHeaderHeight! - scrollView.contentOffset.y)
        headerView!.frame = CGRect(x:0, y: 0, width: headerView!.frame.width, height: originalHeaderHeight! - scrollView.contentOffset.y)
            
            if height == (height + 1){
            scrollView.frame = CGRect(x: 0, y: headerView!.frame.maxY - scrollView.contentOffset.y, width:headerView!.frame.width, height: originalHeaderHeight! + scrollView.contentOffset.y)
            }
            
            print("x: \(scrollView.frame.minX)\ny: \(scrollView.frame.minY)\nwidth: \(scrollView.frame.width)\nheight: \(scrollView.frame.height)")
        }
        //FRAME OFFSET IS THE ISSUE
        //When scrolled UP, should be 44px tall
        // }
        // else{
        // }
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        cards = [CardView]()
        numberOfCards = delegate?.numberOfCards()
        
        if let header = delegate?.headerView?(){
            headerView = header
            headerView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 200)
            cardScrollView = UIScrollView(frame: CGRect(x: 0, y: (headerView?.frame.height)! - UIApplication.sharedApplication().statusBarFrame.height, width: screenWidth, height: screenHeight + UIApplication.sharedApplication().statusBarFrame.height - (headerView?.frame.height)!))
            self.view.addSubview(cardScrollView)
            self.view.addSubview(headerView!)
        }
        else{
            cardScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
            self.view.addSubview(cardScrollView)
        }
        cardScrollView.contentSize = CGSize(width: 0, height: 0)
        cardScrollView.delegate = self
        
        
        if let spacing = delegate?.spacingBetweenCards?(){
            cardSpacing = spacing
        }
        else{
            cardSpacing = 20
        }
        
        if let barIsLight = delegate?.useLightScrollBar?(){
            if barIsLight{
                cardScrollView.indicatorStyle = UIScrollViewIndicatorStyle.White
            }
            else{
                cardScrollView.indicatorStyle = UIScrollViewIndicatorStyle.Black
            }
        }
        else{
            cardScrollView.indicatorStyle = UIScrollViewIndicatorStyle.Black
        }
        
        for i in 0 ..< numberOfCards!{
            let card = delegate!.cardForIndex(i)
            cards!.append(card)
        }
        
        
        if let backgroundColor = delegate?.backgroundColor?(){
            self.view.backgroundColor = backgroundColor
        }
        
        let cardX = CGFloat(111/4.0)
        var currentY = CGFloat(cardSpacing) + cardScrollView.contentSize.height
        for var i = 0; i < numberOfCards; ++i{
            cards[i].frame = CGRect(x: cardX, y: currentY, width: screenWidth - 111 / 2.0, height: 200)
            currentY += cards[i].frame.height + CGFloat(cardSpacing)
            
            let cardTitle = UILabel(frame: CGRect(x: 0, y: 0, width: cards[i].frame.width, height: 30))
            cardTitle.textAlignment = NSTextAlignment.Center
            cardTitle.text = cards[i].title
            if let titleColor = cards[i].titleColor{
                cardTitle.textColor = titleColor
            }
            
            if let titleBackgroundColor = cards[i].titleBackgroundColor{
                let titleBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: cards[i].frame.width, height: 30))
                titleBackgroundView.backgroundColor = titleBackgroundColor
                cards[i].addSubview(titleBackgroundView)
            }
            
            cards[i].addSubview(cardTitle)
            
            cardScrollView.addSubview(cards[i])
            if i + 1 != numberOfCards{
                cardScrollView.contentSize = CGSize(width: cardScrollView.frame.size.width, height: cardScrollView.contentSize.height + cards[i].frame.height + CGFloat(cardSpacing))
            }
            else{
                cardScrollView.contentSize = CGSize(width: cardScrollView.frame.size.width, height: cardScrollView.frame.height + 20)
            }
        }
        if(headerView != nil){
            blurHeaderImageView = UIImageView(frame: (headerView?.frame)!)
            
            
            blurHeaderImageView.image = headerView?.coverImage.image!.blurredImageWithRadius(10, iterations: 20, tintColor: UIColor.clearColor())
            blurHeaderImageView.alpha = 0.0
            self.view.addSubview(blurHeaderImageView)
            
            
            // Set vertical effect
            let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
                type: .TiltAlongVerticalAxis)
            verticalMotionEffect.minimumRelativeValue = -10
            verticalMotionEffect.maximumRelativeValue = 10
            
            // Set horizontal effect
            let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
                type: .TiltAlongHorizontalAxis)
            horizontalMotionEffect.minimumRelativeValue = -10
            horizontalMotionEffect.maximumRelativeValue = 10
            
            // Create group to combine both
            let group = UIMotionEffectGroup()
            group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
            
            // Add both effects to your view
            blurHeaderImageView.addMotionEffect(group)
            headerView?.coverImage.addMotionEffect(group)
        }
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
