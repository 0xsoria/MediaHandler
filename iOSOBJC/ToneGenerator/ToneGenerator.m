//
//  ToneGenerator.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "ToneGenerator.h"
#import <AudioKit/AudioKit.h>

@implementation ToneGenerator

- (void)toneGeneratorWithDuration:(NSNumber *)duration sampleRate:(NSNumber *)sampleRate frequency:(NSNumber *)frequency {
    AudioKitToneGenerator *toneGenerator = [[AudioKitToneGenerator alloc] init];
    [toneGenerator toneGeneratorWithDuration:duration sampleRate:sampleRate frequency:frequency waveFormat:SquareWave andFileFormat:AIFFFormat];
}

@end
