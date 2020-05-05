//
//  MyFilesManager.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 11/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyService.h"
#import "HTTPServiceDelegate.h"

@protocol LocalFilesManagerDelegate <NSObject>

- (void)didStartDownloadingFileFromService;
- (void)downloadFromServiceInProgressWithBytesWritten:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten andTotalBytesExpectedToWrite:(int64_t)totalExpected;
- (void)didFinishDownloadingFileFromService;
- (void)didDeleteFile;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LocalFilesManager : NSObject <HTTPServiceDelegate>

@property (weak) id <LocalFilesManagerDelegate> delegate;

- (instancetype)init;
- (void)saveFile:(NSURL *)fileURL withFileName:(NSString *)fileName;
- (void)downloadFileFromServiceWithURL:(NSString *)url;
- (void)deleteFileAtIndexPath:(NSInteger)index;
- (NSURL *)loadFileAtIndex:(NSInteger)index;
- (NSArray *)loadFiles;

@end

NS_ASSUME_NONNULL_END
