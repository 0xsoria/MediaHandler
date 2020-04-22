//
//  ViewController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 08/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MainViewController.h"
#import "MyTableViewDataSource.h"
#import "AudioPlayerViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [MyTableViewDataSource alloc];
    self.myTableView.dataSource = self.dataSource;
    
    UIBarButtonItem *myRightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target: self action:@selector(addNewItem)];
    [self.navigationItem setRightBarButtonItem:myRightBarButtonItem];
    
    [self addTableView];
    [self tableViewDataVerification];
}

- (void)addTableView {
    [self.view addSubview:self.myTableView];
    self.myTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.myTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.myTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.myTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.myTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
}

- (void)tableViewDataVerification {
    if ([self.dataSource.items count] == 0) {
        self.myTableView.hidden = YES;
        [self addEmptyListLabel];
    }
}

- (void)addEmptyListLabel {
    self.emptyListLabel = [[UILabel alloc] init];
    self.emptyListLabel.numberOfLines = 0;
    self.emptyListLabel.textAlignment = NSTextAlignmentCenter;
    self.emptyListLabel.text = @"There is no file in your library, tap the + button to add.";
    [self.view addSubview: self.emptyListLabel];
    self.emptyListLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.emptyListLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20].active = YES;
    [self.emptyListLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20].active = YES;
    [self.emptyListLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.emptyListLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

- (void)addNewItem {
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"What kind of file you want to add?" message:@"Choose what kind of file you would like to add." preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *downloadAudio = [UIAlertAction actionWithTitle:@"Download Audio File" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self downloadFile];
    }];
    
    UIAlertAction *videoAction = [UIAlertAction actionWithTitle:@"Video" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self authorizationStatus];
    }];
    UIAlertAction *imageAction = [UIAlertAction actionWithTitle:@"Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self authorizationStatus];
    }];
    UIAlertAction *audioAction = [UIAlertAction actionWithTitle:@"Audio" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self cameraInputStatus:MediaInputTypePhoto];
    }];
    UIAlertAction *recordVideoAction = [UIAlertAction actionWithTitle:@"Record Video" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self cameraInputStatus:MediaInputTypeVideo];
    }];
    UIAlertAction *recordAudioAction = [UIAlertAction actionWithTitle:@"Record Audio" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [sheet addAction:downloadAudio];
    [sheet addAction:imageAction];
    [sheet addAction:videoAction];
    [sheet addAction:audioAction];
    [sheet addAction:photoAction];
    [sheet addAction:recordVideoAction];
    [sheet addAction:recordAudioAction];
    [sheet addAction:cancelAction];
    
    [self.navigationController presentViewController:sheet animated:true completion: nil];
    
}

- (void)cameraInputStatus:(MediaInputType)mediaInput {
    InputAuthorizationChecker *checker = [[InputAuthorizationChecker alloc] init];
    [checker cameraAuthorizationStatus:mediaInput completion:^(BOOL completion) {
        if (completion == YES) {
            if (mediaInput == MediaInputTypeVideo || MediaInputTypePhoto) {
                PhotoVideoViewController *sessionViewController = [PhotoVideoViewController alloc];
                [self.navigationController presentViewController:sessionViewController animated:YES completion:nil];
            }
        } else {
            [self noAccessAlert];
        }
    }];
}

- (void)authorizationStatus {
    InputAuthorizationChecker *checker = [[InputAuthorizationChecker alloc] init];
    [checker photosAuthorizationStatus:^(BOOL completion) {
        if (completion == YES) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self getMediaFromLibrary];
            });
        } else {
            [self noAccessAlert];
        }
    }];
}

- (void)downloadFile {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Place the url for the audio file" message:@"URL for file" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"URL";
    }];
    
    UIAlertAction *downloadAction = [UIAlertAction actionWithTitle:@"Play" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        AudioPlayerViewController *playerViewController = [[AudioPlayerViewController alloc] init];
        playerViewController.fileURL = alert.textFields.firstObject.text;
        [self.navigationController pushViewController:playerViewController animated:YES];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:downloadAction];
    [alert addAction:cancelAction];
    
    [self.navigationController presentViewController:alert animated:YES completion:^{
        
    }];
}

- (void)noAccessAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"You do not have access to the photo library, to give the access please go to settings. " preferredStyle:UIAlertControllerStyleAlert];
    
    NSDictionary *dict;
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *urlFromString = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [UIApplication.sharedApplication openURL:urlFromString options:dict completionHandler:nil];
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alert addAction:settingsAction];
    [alert addAction:cancel];
    
    [self.navigationController presentViewController:alert animated:TRUE completion:nil];
    
}

- (void)getMediaFromLibrary {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"oi");
}

@end
