//
//  MenuViewController.m
//  NA
//
//  Created by Alex Taffe on 4/17/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

#define themeColor [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:1.0f]
#define themeColorTransparent [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:0.6f]
#define themeColorNight [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:1.0f]
#define themeColorNightTransparent [UIColor colorWithRed:222/255.0f green:180/255.0f blue:6/255.0f alpha:0.6f]

#define menuBackgroundColor [UIColor clearColor]
#define menuBackgroundColorNight [UIColor colorWithRed:85/255.0f green:85/255.0f blue:85/255.0f alpha:0.6f]
#define menuLabelColor [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f]
#define menuLabelColorNight [UIColor colorWithRed:245/255.0f green:245/255.0f blue:246/255.0f alpha:1.0f]
#define menuSeperatorColor [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f]
#define menuSeperatorColorNight [UIColor colorWithRed:140/255.0f green:242/255.0f blue:244/255.0f alpha:1.0f]

#import "MenuViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "NavigationController.h"
#import "NA-Swift.h"
@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(![Night isNight])
        self.tableView.separatorColor = menuLabelColor;
    else
        self.tableView.separatorColor = menuLabelColorNight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    if(![Night isNight])
        self.tableView.backgroundColor = menuBackgroundColor;
    else
        self.tableView.backgroundColor = menuBackgroundColorNight;
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"Logo"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        
        
        if(![Night isNight])
            imageView.layer.borderColor = themeColor.CGColor;
        else
            imageView.layer.borderColor = themeColorNight.CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"Alexander Taffe";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        if(![Night isNight])
            label.textColor = menuLabelColor;
        else
            label.textColor = menuLabelColorNight;
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    if(![Night isNight])
        cell.textLabel.textColor = menuLabelColor;
    else
        cell.textLabel.textColor = menuLabelColorNight;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10)];
    view.backgroundColor = themeColorTransparent;
    
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        HomeViewController *homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
        navigationController.viewControllers = @[homeViewController];
    } else {
        SecondViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"secondController"];
        navigationController.viewControllers = @[secondViewController];
    }
    
    self.frostedViewController.contentViewController = navigationController;
    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"Home", @"Tyler", @"Assignments",@"Calendar",@"Pass"];
        cell.textLabel.text = titles[indexPath.row];
    } else {
        NSArray *titles = @[@"Settings", @"Credits", @"Something else"];
        cell.textLabel.text = titles[indexPath.row];
    }
    
    return cell;
}
@end
