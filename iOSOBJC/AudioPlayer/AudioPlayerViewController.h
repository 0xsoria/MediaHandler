//
//  AudioPlayerViewController.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioPlayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface AudioPlayerViewController : UIViewController <AudioPlayerDelegate>

@property NSURL *fileURL;
@property AudioPlayer *player;
@property UIProgressView *progressBar;
@property CADisplayLink *updater;

- (instancetype)initWithFileName:(NSURL *)fileURL;

@end

NS_ASSUME_NONNULL_END
