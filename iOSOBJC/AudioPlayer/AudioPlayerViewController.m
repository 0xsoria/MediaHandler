//
//  AudioPlayerViewController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "AudioPlayerViewController.h"
#import "AudioDownloaderAndPlayer.h"

@implementation AudioPlayerViewController

- (instancetype)initWithFileName:(NSURL *)fileURL {
    self = [super init];
    if (self) {
        self.fileURL = fileURL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.downloader.player.delegate = self;
    self.view.backgroundColor = [UIColor redColor];
    [self setupViewContent];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self downloadFileAndPlay];
}

- (void)downloadFileAndPlay {
    self.downloader = [[AudioDownloaderAndPlayer alloc] init];
    [self.downloader audioDownLoaderAndPlayer:self.fileURL];
    [self.downloader playAudioFile];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.downloader stopPlayingAudio];
}


- (void)setupViewContent {
    UIButton *centerButton = [[UIButton alloc] init];
    [self.view addSubview:centerButton];
    [centerButton setTitle:@"Info" forState:UIControlStateNormal];
    [centerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [centerButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [centerButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [centerButton addTarget:self action:@selector(showMetadata) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showMetadata {
    AudioKitMetadata *metadata = [[AudioKitMetadata alloc] init];
    NSDictionary *fileMetadata = [metadata getFileMetadataAt:[self.fileURL absoluteString]];
    NSLog(@"%@", fileMetadata);
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"Okay finished playing");
    [self.downloader stopPlayingAudio];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    NSLog(@"Error");
}

@end
