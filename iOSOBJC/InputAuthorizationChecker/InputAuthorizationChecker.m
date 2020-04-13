//
//  InputAuthorizationChecker.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "InputAuthorizationChecker.h"

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

- (void)cameraAuthorizationStatus:(MediaInputType)mediaType completion:(void (^ __nullable)(BOOL))completion {
    if (mediaType == MediaInputTypeVideo) {
        switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                        if (granted) {
                            completion(YES);
                        } else {
                            completion(NO);
                        }
                    }];
                }
                break;
            case AVAuthorizationStatusRestricted:
                completion(NO);
                break;
            case AVAuthorizationStatusDenied:
                completion(NO);
                break;
            case AVAuthorizationStatusAuthorized:
                completion(YES);
                break;
        }
    } else if (mediaType == MediaInputTypePhoto) {
        switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio]) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                        if (granted) {
                            completion(YES);
                        } else {
                            completion(NO);
                        }
                    }];
                }
                break;
            case AVAuthorizationStatusRestricted:
                completion(NO);
                break;
            case AVAuthorizationStatusDenied:
                completion(NO);
                break;
            case AVAuthorizationStatusAuthorized:
                completion(YES);
                break;
        }
    }
}

@end
