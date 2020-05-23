//
//  MainSplitViewController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 23/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MainNavigationController.h"
#import "MainSplitViewController.h"
#import "MainViewController.h"
#import "MainDetailViewController.h"

@interface MainSplitViewController ()

@end

@implementation MainSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    MainViewController *main = [[MainViewController alloc] init];
    MainDetailViewController *detail = [[MainDetailViewController alloc] init];
    MainNavigationController *navigationController = [[MainNavigationController alloc] initWithRootViewController:main];
    
    NSArray *viewControllers = [NSArray arrayWithObjects:navigationController, detail, nil];
    
    self.viewControllers = viewControllers;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return YES;
}

@end
