//
//  AudioPlayerView.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 10/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AudioPlayerViewDelegate <NSObject>



@end

NS_ASSUME_NONNULL_BEGIN

@interface AudioPlayerView : UIView

@property UILabel *nameOfFileLabel;
@property UIProgressView *progressView;
@property UIView *volumeControl;
@property (weak) id <AudioPlayerViewDelegate> delegate;

- (instancetype)myInit;

@end

NS_ASSUME_NONNULL_END
