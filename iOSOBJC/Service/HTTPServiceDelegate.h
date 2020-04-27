//
//  HTTPServiceDelegate.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 26/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HTTPServiceDelegate <NSObject>

- (void)didStartDownloadingFile;
- (void)didFinishDownloadingFileToURL:(NSURL *)temporaryLocation;
- (void)didDownloadProgressStarted:(int64_t)justWrote totalWritten:(int64_t)totalWritten totalToBeWritten:(int64_t)total;

@end

NS_ASSUME_NONNULL_END
