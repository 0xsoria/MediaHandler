//
//  ViewController.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 08/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewDataSource.h"
#import "InputAuthorizationChecker.h"
#import "PhotoVideoViewController.h"

@interface MainViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property UITableView *myTableView;
@property UILabel *emptyListLabel;
@property MyTableViewDataSource *dataSource;

- (void)addNewItem;
- (void)tableViewDataVerification;
- (void)addTableView;
- (void)addEmptyListLabel;
- (void)getMediaFromLibrary;
- (void)authorizationStatus;

@end

