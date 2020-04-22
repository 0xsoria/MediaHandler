//
//  AudioPlayerViewController.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioDownloaderAndPlayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface AudioPlayerViewController : UIViewController <AVAudioPlayerDelegate>

@property NSString *fileURL;
@property AudioDownloaderAndPlayer *downloader;

@end

NS_ASSUME_NONNULL_END
