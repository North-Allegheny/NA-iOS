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
    private var numberOfCards:Int!
    private var cards:[CardView]!
    private var scrollView:UIScrollView!
    private var cardSpacing:Float!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        cards = [CardView]()
        numberOfCards = delegate?.numberOfCards()
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: 0, height: 0)
        self.view.addSubview(scrollView)
        
        if let spacing = delegate?.spacingBetweenCards?(){
            cardSpacing = spacing
        }
        else{
            cardSpacing = 20
        }
        
        if let barIsLight = delegate?.useLightScrollBar?(){
            if barIsLight{
                scrollView.indicatorStyle = UIScrollViewIndicatorStyle.White
            }
            else{
                scrollView.indicatorStyle = UIScrollViewIndicatorStyle.Black
            }
        }
        else{
            scrollView.indicatorStyle = UIScrollViewIndicatorStyle.Black
        }
        
        print(numberOfCards)
        
        for i in 0 ..< numberOfCards!{
            let card = delegate!.cardForIndex(i)
            cards!.append(card)
            print("test")
        }
        
        
        if let backgroundColor = delegate?.backgroundColor?(){
            self.view.backgroundColor = backgroundColor
        }
        
        let cardX = CGFloat(111/4.0)
        var currentY = CGFloat(cardSpacing)
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
            
            scrollView.addSubview(cards[i])
            if i + 1 != numberOfCards{
                scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.contentSize.height + cards[i].frame.height + CGFloat(cardSpacing))
            }
            else{
                scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.height + 20)
            }
        }
        print(scrollView.frame)

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
