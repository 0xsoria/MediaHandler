//
//  Service.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 21/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MyService.h"

@implementation MyService

@synthesize session;

- (void)fileDownloader:(NSString *_Nonnull)withURLString andFileName:(NSString *)fileName {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:fileName];
    sessionConfiguration.sessionSendsLaunchEvents = YES;
    [sessionConfiguration setDiscretionary:YES];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    self.session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:queue];
    
    NSURL *url = [NSURL URLWithString:withURLString];
    
    self.downloadTask = [session downloadTaskWithURL:url];
    [self.downloadTask resume];
    [self.delegate didStartDownloadingFile];
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    NSLog(@"finished events for background session");
}

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
    NSLog(@"did become invalid");
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    if (self.downloadTask == downloadTask) {
        [self.delegate didDownloadProgressStarted:bytesWritten totalWritten:totalBytesWritten totalToBeWritten:totalBytesExpectedToWrite];
    }
}

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    [self.delegate didFinishDownloadingFileToURL:location withName:session.configuration.identifier];
    [session finishTasksAndInvalidate];
}

@synthesize delegate;

@end
