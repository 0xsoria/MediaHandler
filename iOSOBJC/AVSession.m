//
//  AVSession.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "AVSession.h"

@implementation AVSession

- (void)captureSession {
    AVCaptureSession *captureSession = [AVCaptureSession new];
    AVCaptureDeviceInput *cameraDeviceInput = [AVCaptureDeviceInput init];
    AVCaptureDeviceInput *micDeviceInput = [AVCaptureDeviceInput init];
    AVCaptureMovieFileOutput *movieFileOutput = [AVCaptureMovieFileOutput new];
    
    if ([captureSession canAddInput:cameraDeviceInput]) {
        [captureSession addInput:cameraDeviceInput];
    } else if ([captureSession canAddInput:micDeviceInput]) {
        [captureSession addInput:micDeviceInput];
    } else if ([captureSession canAddOutput:movieFileOutput]) {
        [captureSession addOutput:movieFileOutput];
    }
    [captureSession startRunning];
}

@end
