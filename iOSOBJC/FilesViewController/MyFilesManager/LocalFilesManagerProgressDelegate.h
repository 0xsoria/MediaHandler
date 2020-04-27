//
//  LocalFilesManagerProgressDelegate.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 26/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LocalFilesManagerProgressDelegate <NSObject>

- (void)didStartDownloadingFileWithFileNameOrURL:(NSString *)urlOrName;
- (void)didDownloadProgressStarted:(int64_t)justWrote totalWritten:(int64_t)totalWritten totalToBeWritten:(int64_t)totalToBeWritten;
- (void)didFinishDownloadingFile:(NSURL *)urlOfFile;

@end

NS_ASSUME_NONNULL_END
