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
#import <AudioKit/AudioKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AudioPlayerDelegate <NSObject>

- (void)progressUpdateWithCurrentPosition:(float)currentPosition;
- (void)countdownUpWithTime:(NSString *)time;
- (void)countdownTimeWithTime:(NSString *)time;
- (void)meterLevelWithLevel:(double)level;
- (void)didDisconnectVolumeTap;
- (void)setUpdaterToPaused:(BOOL)paused;

@end

@interface AudioPlayer : NSObject <AVAudioPlayerDelegate>

@property AVAudioPlayerNode *player;
@property AVAudioEngine *engine;
@property AVAudioUnitVarispeed *speedControl;
@property AVAudioUnitTimePitch *pitchControl;
@property AVAudioSession *audioSession;
@property AudioKitMetadata *metadata;
@property (nonatomic) AVAudioFile *file;
@property AVAudioFormat *format;
@property NSURL *fileURL;
@property AVAudioFramePosition audioLengthSamples;
@property float audioLenghtSeconds;
@property (weak) id <AudioPlayerDelegate> delegate;

- (instancetype)initWith;

- (void)audioDownLoaderAndPlayer:(NSURL *)url;
- (void)stopPlayingAudio;
- (void)setPlayOrPause;
- (NSDictionary *)fileMetadata;
- (void)progressUpdate;
- (void)seek:(float)time;

@end

NS_ASSUME_NONNULL_END
