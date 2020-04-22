//
//  AudioDownloader.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "AudioDownloaderAndPlayer.h"

@implementation AudioDownloaderAndPlayer

- (void)audioDownLoaderAndPlayer:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSError *sessionError;
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [self.player prepareToPlay];
    
    self.audioSession = [AVAudioSession sharedInstance];
    [self.audioSession setCategory:AVAudioSessionCategoryPlayback error:&sessionError];
    
    assert(error == nil);
}

- (void)playAudioFile {
    [self.player play];
}

- (void)stopPlayingAudio {
    [self.player stop];
}

@end
