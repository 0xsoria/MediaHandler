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
#import "MyTableViewCell.h"
#import "PresentationObject.h"

@implementation MainViewController

//MARK: - Super Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filesManager = [[LocalFilesManager alloc] init];
    self.filesManager.delegate = self;
    self.myTableView = [[InitialTableView alloc] init];
    
    [self setupInterface];
    [self tableViewDataVerification];
}

//MARK: - Methods

- (void)setupInterface {
    
    UIBarButtonItem *myRightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target: self action:@selector(addNewItem)];
    [self.navigationItem setRightBarButtonItem:myRightBarButtonItem];
    
    [self.view addSubview:self.myTableView];
    [self.myTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.myTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.myTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.myTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.myTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
}

- (void)tableViewDataVerification {
    NSArray *files = [self.filesManager loadFiles];
    self.dataSource = [[MyTableViewDataSource alloc] initWithItems:files];
    self.dataSource.delegate = self;
    self.myTableView.dataSource = self.dataSource;
    self.myTableView.delegate = self.dataSource;
    
    if ([self.dataSource.items count] == 0) {
        self.myTableView.hidden = YES;
        [self addEmptyListLabel];
    }
}

- (void)tableViewUpdate {
    NSArray *files = [self.filesManager loadFiles];
    NSMutableArray *mutable = [[NSMutableArray alloc] initWithArray:files];
    [self.dataSource setItems:mutable];
    [self.myTableView reloadData];
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
    __weak MainViewController *weakSelf = self;
    PresentationObject *presenter = [[PresentationObject alloc] init];
    [presenter presentNewItemAlertWithNavigationController:self.navigationController completion:^(MediaAction media) {
        switch (media) {
            case MediaActionDownloadAudio:
                [weakSelf downloadFile];
                break;
            case MediaActionVideo:
                break;
            case MediaActionToneGenenerator:
                [weakSelf toneGenerator];
                break;
            case MediaActionImageAction:
                break;
            case MediaActionAudioPlayer:
                break;
            case MediaActionPhotoAction:
                break;
            case MediaActionRecordVideo:
                break;
            case MediaActionRecordAudio:
                break;
            case MediaActionCancel:
                break;
        }
    }];
}

- (void)toneGenerator {
    __weak MainViewController *weakSelf = self;
    PresentationObject *presenter = [[PresentationObject alloc] init];
    [presenter toneGeneratorPresenter:self.navigationController withDurationSampleRateAndFrequency:^(NSNumber * _Nonnull duration, NSNumber * _Nonnull sampleRate, NSNumber * _Nonnull frequency) {
        ToneGenerator *toneGenerator = [[ToneGenerator alloc] init];
        [toneGenerator toneGeneratorWithDuration:duration sampleRate:sampleRate frequency:frequency];
        [weakSelf tableViewUpdate];
    }];
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
    __weak MainViewController *weakSelf = self;
    PresentationObject *presenter = [[PresentationObject alloc] init];
    [presenter presentFileDownloaderAlertWithNavigationController:self.navigationController completion:^(NSString * _Nonnull returnData) {
        [weakSelf.filesManager downloadFileFromServiceWithURL:returnData];
    }];
}

- (void)noAccessAlert {
    PresentationObject *presenter = [[PresentationObject alloc] init];
    [presenter noAccessAlert:self.navigationController];
}

- (void)getMediaFromLibrary {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

//MARK: - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"oi");
}

//MARK: - LocalFilesManagerDelegate

- (void)didDeleteFile {
    [self tableViewUpdate];
}

- (void)didStartDownloadingFileFromService {
    
}

- (void)downloadFromServiceInProgressWithBytesWritten:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten andTotalBytesExpectedToWrite:(int64_t)totalExpected {
    
    
}

- (void)didFinishDownloadingFileFromService {
    [self tableViewUpdate];
}

//MARK: - MyDataSourceDelegate

- (void)didDeleteAnItemAtIndex:(NSInteger)index {
    [self.filesManager deleteFileAtIndexPath:index];
}

- (void)didSelectRow:(NSInteger)row {
    NSURL *file = [self.filesManager loadFileAtIndex:row];
    UIViewController *audioPlayer = [[AudioPlayerViewController alloc] initWithFileName:file];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController presentViewController:audioPlayer animated:YES completion:nil];
    });
}

@end
