//
//  AVSession.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AVCamSetupResult) {
    AVCamSetupResultSuccess,
    AVCamSetupResultCameraNotAuthorized,
    AVCamSetupResultSessionConfigurationFailed
};

@interface AVSession : NSObject

@property AVCamSetupResult setupResult;
@property AVCaptureSession *session;
@property AVCaptureDeviceInput *videoDeviceInput;

@end

NS_ASSUME_NONNULL_END
