//
//  ToneGenerator.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioKit/AudioKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToneGenerator : NSObject

- (void)toneGeneratorWithDuration:(NSNumber *)duration sampleRate:(NSNumber *)sampleRate frequency:(NSNumber *)frequency;

@end

NS_ASSUME_NONNULL_END
