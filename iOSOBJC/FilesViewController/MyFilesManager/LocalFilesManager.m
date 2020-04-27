//
//  MyFilesManager.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 11/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "LocalFilesManager.h"
#import "MyService.h"

@implementation LocalFilesManager

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)loadFiles {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    //load files here
    
}

- (void)saveFile:(NSURL *)fileURL {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *myURL = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *savedURL = [myURL URLByAppendingPathComponent:fileURL.lastPathComponent];
    //NSError *myError;
    
    NSData *contents = [NSData dataWithContentsOfURL:savedURL];
    [contents writeToURL:savedURL atomically:YES];
    
    //[fileManager moveItemAtURL:fileURL toURL:savedURL error:&myError];
}

- (void)downloadFileFromServiceWithURL:(NSString *)url {
    MyService *service = [[MyService alloc] init];
    service.delegate = self;
    [service fileDownloader:url];
}

- (void)didStartDownloadingFile {
    NSLog(@"Started");
}

- (void)didFinishDownloadingFileToURL:(NSURL *)temporaryLocation {
    [self saveFile:temporaryLocation];
}

- (void)didDownloadProgressStarted:(int64_t)justWrote totalWritten:(int64_t)totalWritten totalToBeWritten:(int64_t)totalToBeWritten {
    NSLog(@"just wrote %lld, total written %lld and total to be written %lld", justWrote, totalWritten, totalToBeWritten);
}

@end
