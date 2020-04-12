//
//  MainNavigationController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainViewController.h"
#import "SettingsViewController.h"
#import "MainNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainViewController *myViewController = [[MainViewController alloc] init];
    MainNavigationController *mainNavigation = [[MainNavigationController alloc] initWithRootViewController:myViewController];
    
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
    MainNavigationController *settingsNavigation = [[MainNavigationController alloc] initWithRootViewController:settingsViewController];
    
    NSArray *viewController = [[NSArray alloc] initWithObjects:mainNavigation, settingsNavigation, nil];
    
    self.viewControllers = viewController;
}

@end
