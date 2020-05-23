//
//  SettingsSplitViewController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 23/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MainNavigationController.h"
#import "SettingsSplitViewController.h"
#import "SettingsViewController.h"
#import "SettingsDetailViewController.h"

@interface SettingsSplitViewController ()

@end

@implementation SettingsSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    SettingsViewController *main = [[SettingsViewController alloc]init];
    SettingsDetailViewController *detail = [[SettingsDetailViewController alloc]init];
    MainNavigationController *navigation = [[MainNavigationController alloc] initWithRootViewController:main];
    NSArray *viewControllers = [NSArray arrayWithObjects:navigation, detail, nil];
    self.viewControllers = viewControllers;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return YES;
    
}

@end
