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

- (NSURL *)loadFileAtIndex:(NSInteger)index {
    NSArray *files = [self loadFiles];
    NSURL *url = [files objectAtIndex:index];
    return url;
}

- (NSArray *)loadFiles {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsFolder = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSError *error;
    NSArray *files = [fileManager contentsOfDirectoryAtURL:documentsFolder includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    
    return files;
}

- (void)deleteFileAtIndexPath:(NSInteger)index {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsFolder = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSError *error;
    NSArray *files = [fileManager contentsOfDirectoryAtURL:documentsFolder includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    NSURL *url = [files objectAtIndex:index];
    NSError *deleteError;
    
    BOOL isDeleted = [fileManager removeItemAtURL:url error:&deleteError];
    if (isDeleted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate didDeleteFile];
        });
    } else {
        //error deleting file
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate didDeleteFile];
        });
    }
}

- (void)saveFile:(NSURL *)fileURL withFileName:(NSString *)fileName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *firstItem = [urls firstObject];
    NSURL *itemPathToBeSaved = [firstItem URLByAppendingPathComponent:fileName];
    
    NSData *fileData = [NSData dataWithContentsOfURL:fileURL];
    
    [fileManager createFileAtPath:itemPathToBeSaved.path contents:fileData attributes:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.delegate didFinishDownloadingFileFromService];
    });
}

- (void)downloadFileFromServiceWithURL:(NSString *)url {
    MyService *service = [[MyService alloc] init];
    service.delegate = self;
    NSString *path = [[NSURL URLWithString:url] lastPathComponent];
    [service fileDownloader:url andFileName:path];
}

- (void)didStartDownloadingFile {
    NSLog(@"Started");
}

- (void)didFinishDownloadingFileToURL:(NSURL *)temporaryLocation withName:(NSString *)name {
    [self saveFile:temporaryLocation withFileName:name];
}

- (void)didDownloadProgressStarted:(int64_t)justWrote totalWritten:(int64_t)totalWritten totalToBeWritten:(int64_t)totalToBeWritten {
    NSLog(@"just wrote %lld, total written %lld and total to be written %lld", justWrote, totalWritten, totalToBeWritten);
}

@end
