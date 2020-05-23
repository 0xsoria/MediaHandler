//
//  SceneDelegate.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 08/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "SceneDelegate.h"
#import "MainViewController.h"
#import "MainTabBarController.h"
#import "MainNavigationController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene *myScene = (UIWindowScene *)scene;
    
    self.window = [[UIWindow alloc] initWithFrame: myScene.coordinateSpace.bounds];
    self.window.windowScene = myScene;
    
    MainTabBarController *myTabBarController = [[MainTabBarController alloc] init];
    
    [self.window setRootViewController: myTabBarController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
}


- (void)sceneWillResignActive:(UIScene *)scene {
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
}


@end
