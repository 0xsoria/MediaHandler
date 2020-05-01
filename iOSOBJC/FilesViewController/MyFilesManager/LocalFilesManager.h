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

NS_ASSUME_NONNULL_BEGIN

@interface LocalFilesManager : NSObject <HTTPServiceDelegate>

- (instancetype)init;
- (void)saveFile:(NSURL *)fileURL withFileName:(NSString *)fileName;
- (void)downloadFileFromServiceWithURL:(NSString *)url;
- (NSArray *)loadFiles;

@end

NS_ASSUME_NONNULL_END
