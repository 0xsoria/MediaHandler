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

@protocol InputAuthorizerDelegate <NSObject>
@optional
//- (void)something:(id)something didFinishLoadingItem:(id)item;
//- (void)something:(id)something didFailWithError:(NSError *)error;
- (void)setupOrientation: (AVCaptureVideoOrientation *)orientation;
@end

@interface AVSession : NSObject

@property AVCamSetupResult setupResult;
@property AVCaptureSession *session;
@property AVCaptureDeviceInput *videoDeviceInput;
@property (nonatomic, weak) id<InputAuthorizerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
