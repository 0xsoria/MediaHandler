//
//  PhotoVideoViewController.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 14/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AVSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoVideoViewController : UIViewController <InputAuthorizerDelegate>

@property (nonatomic, readonly) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic) AVCaptureSession *session;
@property AVSession *myAVSession;

@end

NS_ASSUME_NONNULL_END
