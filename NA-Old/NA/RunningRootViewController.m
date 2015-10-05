//
//  RunningRootViewController.m
//  NA
//
//  Created by Alex Taffe on 4/17/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

#import "RunningRootViewController.h"

@interface RunningRootViewController ()

@end

@implementation RunningRootViewController
@synthesize cover;

bool hasDismissed = false;

-(void)awakeFromNib{
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
}
-(void)viewDidAppear:(BOOL)animated{

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
