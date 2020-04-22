//
//  PhotoVideoViewController.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 14/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "PhotoVideoViewController.h"
#import "AVSession.h"

@interface PhotoVideoViewController ()

@end

@implementation PhotoVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myAVSession.delegate = self;
}

- (void)setupOrientation:(AVCaptureVideoOrientation *)orientation {
    self.videoPreviewLayer.connection.videoOrientation = *(orientation);
}

@end
