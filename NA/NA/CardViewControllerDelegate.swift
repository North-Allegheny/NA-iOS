//
//  CardViewControllerDelegate.swift
//  NA
//
//  Created by Alex Taffe on 10/22/15.
//  Copyright © 2015 NA App. All rights reserved.
//

import Foundation

@objc public protocol CardViewControllerDelegate:NSObjectProtocol{
    //Data functions
    func numberOfCards()->Int
    func cardForIndex(index:Int)->CardView
    optional func headerView()->HomeHeaderView
    
    //formatting functions
    optional func spacingBetweenCards()->Float
    optional func backgroundColor()->UIColor
    optional func headerShouldMinimize()->Bool
    optional func useLightScrollBar()->Bool
    
}