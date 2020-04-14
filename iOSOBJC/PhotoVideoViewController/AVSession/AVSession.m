//
//  AVSession.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "AVSession.h"

@implementation AVSession

- (void)setupSession:(UIInterfaceOrientation *)windowOrientation {
    
    NSError* error = nil;
    
    if (self.setupResult != AVCamSetupResultSuccess) {
        return;
    }
    
    [self.session beginConfiguration];
    
    self.session.sessionPreset = AVCaptureSessionPresetPhoto;
    
    AVCaptureDevice* videoDevice = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInDualCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionBack];
    
    if (!videoDevice) {
        videoDevice = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionBack];
        if (!videoDevice) {
            videoDevice = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionFront];
        }
    }
    
    AVCaptureDeviceInput* videoDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&error];
    
    if (!videoDeviceInput) {
        self.setupResult = AVCamSetupResultSessionConfigurationFailed;
        [self.session commitConfiguration];
        return;
    }
    
    if ([self.session canAddInput:videoDeviceInput]) {
        [self.session addInput:videoDeviceInput];
        self.videoDeviceInput = videoDeviceInput;
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            AVCaptureVideoOrientation initialVideoOrientation = AVCaptureVideoOrientationPortrait;
            if (windowOrientation != UIInterfaceOrientationUnknown) {
                initialVideoOrientation = (AVCaptureVideoOrientation) windowOrientation;
            }
            
        });
    }
    
    
}

@end
