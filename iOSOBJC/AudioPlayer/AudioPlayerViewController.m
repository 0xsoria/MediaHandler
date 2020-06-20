//
//  AudioPlayerViewController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "AudioPlayerViewController.h"

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
    self.view.backgroundColor = [UIColor redColor];
    [self setupViewContent];
    [self downloadFileAndPlay];
    [self setupProgress];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)downloadFileAndPlay {
    self.player = [[AudioPlayer alloc] initWith];
    self.player.delegate = self;
    [self.player audioDownLoaderAndPlayer:self.fileURL];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player stopPlayingAudio];
    [self.updater invalidate];
}

- (void)setupProgress {
    self.updater = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateProgress)];
    [self.updater addToRunLoop:NSRunLoop.currentRunLoop forMode:NSDefaultRunLoopMode];
    [self.updater setPaused:YES];
}

- (void)updateProgress {
    [self.player progressUpdate];
}

- (void)setupViewContent {
    UIButton *centerButton = [[UIButton alloc] init];
    [self.view addSubview:centerButton];
    [centerButton setTitle:@"Info" forState:UIControlStateNormal];
    [centerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [centerButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [centerButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [centerButton addTarget:self action:@selector(showMetadata) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *playPauseButton = [UIButton new];
    [self.view addSubview:playPauseButton];
    [playPauseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [playPauseButton.topAnchor constraintEqualToAnchor:centerButton.bottomAnchor constant:20].active = YES;
    [playPauseButton.heightAnchor constraintEqualToConstant:20].active = YES;
    [playPauseButton.centerXAnchor constraintEqualToAnchor:centerButton.centerXAnchor constant:0].active = YES;
    [playPauseButton setTitle:@"PlayPause" forState:UIControlStateNormal];
    [playPauseButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *skipTen = [UIButton new];
    [self.view addSubview:skipTen];
    [skipTen setTranslatesAutoresizingMaskIntoConstraints:NO];
    [skipTen.topAnchor constraintEqualToAnchor:playPauseButton.bottomAnchor constant:20].active = YES;
    [skipTen.heightAnchor constraintEqualToConstant:20].active = YES;
    [skipTen.centerXAnchor constraintEqualToAnchor:centerButton.centerXAnchor constant:0].active = YES;
    [skipTen setTitle:@"+10" forState:UIControlStateNormal];
    [skipTen addTarget:self action:@selector(skipTenSeconds) forControlEvents:UIControlEventTouchUpInside];
    
    self.progressBar = [UIProgressView new];
    [self.progressBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.progressBar];
    [self.progressBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10].active = YES;
    [self.progressBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
    [self.progressBar.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;
    [self.progressBar.heightAnchor constraintEqualToConstant:20].active = YES;
}

- (void)pause {
    [self.player setPlayOrPause];
}

- (void)showMetadata {
    [self.player fileMetadata];
}

- (void)skipTenSeconds {
    [self.player seek:10];
}

//Audio Player Delegate

- (void)progressUpdateWithCurrentPosition:(float)currentPosition {
    self.progressBar.progress = currentPosition;
}

- (void)countdownTimeWithTime:(NSString *)time {
    
}

- (void)countdownUpWithTime:(NSString *)time {
    
}

- (void)meterLevelWithLevel:(double)level {
    
}

- (void)didDisconnectVolumeTap {
    
}

- (void)setUpdaterToPaused:(BOOL)paused {
    self.updater.paused = paused;
}

@end
