//
//  AudioKitToneGenerator.h
//  AudioKit
//
//  Created by Gabriel Soria Souza on 16/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

NS_ASSUME_NONNULL_BEGIN

@interface AudioKitToneGenerator : NSObject

@property NSNumber *duration;
@property NSNumber *sampleRate;

- (void)toneGeneratorWithDuration:(NSNumber *)duration sampleRate:(NSNumber *)sampleRate frequency:(NSNumber *)frequency;

@end

NS_ASSUME_NONNULL_END
