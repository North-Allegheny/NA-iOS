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

-(void)awakeFromNib{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
