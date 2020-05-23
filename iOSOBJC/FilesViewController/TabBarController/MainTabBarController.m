//
//  MainNavigationController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainSplitViewController.h"
#import "SettingsSplitViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainSplitViewController *main = [[MainSplitViewController alloc]init];
    SettingsSplitViewController *settings = [[SettingsSplitViewController alloc]init];
    
    NSArray *viewController = [[NSArray alloc] initWithObjects:main, settings, nil];
    
    self.viewControllers = viewController;
    
    [self.tabBar.items.firstObject setTitle:@"Files"];
    [self.tabBar.items[1] setTitle:@"Settings"];
}

@end
