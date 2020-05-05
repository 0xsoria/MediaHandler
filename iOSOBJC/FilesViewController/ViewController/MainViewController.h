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
#import "LocalFilesManager.h"
#import "InitialTableView.h"

@interface MainViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, LocalFilesManagerDelegate, MyTableViewDataSourceDelegate>

@property InitialTableView *myTableView;
@property UILabel *emptyListLabel;
@property MyTableViewDataSource *dataSource;
@property LocalFilesManager *filesManager;

- (void)addNewItem;
- (void)tableViewDataVerification;
- (void)addEmptyListLabel;
- (void)getMediaFromLibrary;
- (void)authorizationStatus;

@end

