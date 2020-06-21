//
//  AudioPlayerViewController.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioKit/AudioKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AudioPlayerViewController : UIViewController <AudioKitAudioPlayerDelegate>

@property NSURL *fileURL;
@property AudioKitAudioPlayer *player;
@property UIProgressView *progressBar;
@property CADisplayLink *updater;

- (instancetype)initWithFileName:(NSURL *)fileURL;

@end

NS_ASSUME_NONNULL_END
