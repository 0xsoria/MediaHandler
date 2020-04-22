//
//  AudioPlayerViewController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "AudioPlayerViewController.h"
#import "AudioDownloaderAndPlayer.h"

@interface AudioPlayerViewController ()

@end

@implementation AudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.downloader.player.delegate = self;
    [self downloadFileAndPlay];
}

- (void)downloadFileAndPlay {
    self.downloader = [[AudioDownloaderAndPlayer alloc] init];
    [self.downloader audioDownLoaderAndPlayer:self.fileURL];
    [self.downloader playAudioFile];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"Okay finished playing");
    [self.downloader stopPlayingAudio];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    NSLog(@"Error");
}

@end