//
//  InputAuthorizationChecker.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "InputAuthorizationChecker.h"
#import <Photos/Photos.h>

@implementation InputAuthorizationChecker

- (void)inputAuthorizationChecker:(AVMediaType)mediaType completion:(void (^ __nullable)(void))completion {
    completion();
}

- (void)photosAuthorizationStatus:(void (^ __nullable)(BOOL))completion {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    __block BOOL returnStatus = NO;
    
    switch (status) {
        case PHAuthorizationStatusNotDetermined: {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) {
                    returnStatus = YES;
                    completion(returnStatus);
                } else {
                    returnStatus = NO;
                    completion(returnStatus);
                }
            }];
            break;
        }
        case PHAuthorizationStatusRestricted:
            break;
        case PHAuthorizationStatusDenied:
            returnStatus = NO;
            completion(returnStatus);
            break;
        case PHAuthorizationStatusAuthorized:
            returnStatus = YES;
            completion(returnStatus);
            break;
    }
}

- (AVAuthorizationStatus)inputAuthorizationChecker:(AVMediaType)mediaType {
    switch ([AVCaptureDevice authorizationStatusForMediaType:mediaType]) {
        case AVAuthorizationStatusNotDetermined:
            return AVAuthorizationStatusNotDetermined;
            break;
        case AVAuthorizationStatusRestricted:
            return AVAuthorizationStatusRestricted;
            break;
        case AVAuthorizationStatusDenied:
            return AVAuthorizationStatusDenied;
            break;
        case AVAuthorizationStatusAuthorized:
            return AVAuthorizationStatusAuthorized;
            break;
    }
}

@end


typedef enum InputType {
    audio,
    video,
    
} InputType;
