//
//  NavigationController.m
//  NA
//
//  Created by Alex Taffe on 4/17/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

#define themeColor [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:1.0f]
#define themeColorTransparent [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:0.6f]
#define themeColorNight [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:1.0f]
#define themeColorNightTransparent [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:0.6f]

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognized:)]];
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar setTintColor:themeColorTransparent];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)panGestureRecognized:(UIPanGestureRecognizer *)sender{
    //dismiss the keyboard
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    //show the menu
    [self.frostedViewController panGestureRecognized:sender];
}

@end
