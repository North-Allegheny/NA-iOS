//
//  CardViewControllerDelegate.swift
//  NA
//
//  Created by Alex Taffe on 10/22/15.
//  Copyright © 2015 NA App. All rights reserved.
//

import Foundation

@objc public protocol CardViewControllerDelegate:NSObjectProtocol{
    func numberOfCards()->Int
    optional func spacingBetweenCards()->Int
    func cardForIndex(int:index)->CardView
}