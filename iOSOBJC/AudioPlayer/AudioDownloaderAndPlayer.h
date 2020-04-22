//
//  AudioDownloader.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AudioDownloaderAndPlayer : NSObject

@property AVAudioPlayer *player;
@property AVAudioSession *audioSession;

- (void)audioDownLoaderAndPlayer:(NSString *)urlString;
- (void)playAudioFile;
- (void)stopPlayingAudio;

@end

NS_ASSUME_NONNULL_END
