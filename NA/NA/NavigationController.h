//
//  NavigationController.h
//  NA
//
//  Created by Alex Taffe on 4/17/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface NavigationController : UINavigationController
- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender;
@end
