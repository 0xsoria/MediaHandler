//
//  InputAuthorizationChecker.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 12/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

//@protocol InputAuthorizerDelegate <NSObject>
//@optional
//- (void)didAuthorizeAccess;
//- (void)didNotAuthorizeAccess;
////- (void)something:(id)something didFinishLoadingItem:(id)item;
////- (void)something:(id)something didFailWithError:(NSError *)error;
//@end

typedef NS_ENUM (NSInteger, MediaInputType) {
    MediaInputTypePhoto,
    MediaInputTypeVideo,
    MediaInputTypeAudio
};

NS_ASSUME_NONNULL_BEGIN

@interface InputAuthorizationChecker : NSObject

- (void)inputAuthorizationChecker:(AVMediaType)mediaType completion:(void (^ __nullable)(void))completion;
- (AVAuthorizationStatus)inputAuthorizationChecker:(AVMediaType)mediaType;
- (void)photosAuthorizationStatus:(void (^ __nullable)(BOOL))completion;
- (void)cameraAuthorizationStatus:(MediaInputType)mediaType completion:(void (^ __nullable)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
