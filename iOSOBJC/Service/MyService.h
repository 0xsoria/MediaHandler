//
//  Service.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 21/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalFilesManager.h"
#import "HTTPServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyService : NSObject <HTTPServiceProtocol, NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@property NSURLSessionDownloadTask *downloadTask;
@property (weak) id <HTTPServiceDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
