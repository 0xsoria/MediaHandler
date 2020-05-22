//
//  PresentationObject.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 16/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MediaAction) {
    MediaActionDownloadAudio,
    MediaActionVideo,
    MediaActionToneGenenerator,
    MediaActionImageAction,
    MediaActionAudioPlayer,
    MediaActionPhotoAction,
    MediaActionRecordVideo,
    MediaActionRecordAudio,
    MediaActionCancel
};

@interface PresentationObject : NSObject

- (void)presentNewItemAlertWithNavigationController:(UINavigationController *)navigationController completion:(void (^ __nullable)(MediaAction))completion;
- (void)presentFileDownloaderAlertWithNavigationController:(UINavigationController *)navigationController completion:(void (^ __nullable)(NSString *))completion;
- (void)noAccessAlert:(UINavigationController *)navigationController;

- (void)toneGeneratorPresenter:(UINavigationController *)navigationController withDurationSampleRateAndFrequency:(void (^ __nullable)(NSNumber *, NSNumber *, NSNumber *, NSError *))withDurationSampleRateAndFrequency;

- (void)toneGeneratorError:(UINavigationController *)navigationController;


@end

NS_ASSUME_NONNULL_END
