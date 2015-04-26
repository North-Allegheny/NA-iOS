//
//  IntroViewController.h
//  NA
//
//  Created by Joshua Thomas on 4/20/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;

@end
