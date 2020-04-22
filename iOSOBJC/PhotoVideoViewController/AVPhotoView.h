//
//  AVPhotoView.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 14/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVPhotoView : UIView

@property (nonatomic, readonly) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic) AVCaptureSession *session;

@end

NS_ASSUME_NONNULL_END
