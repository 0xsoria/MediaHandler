//
//  MyFilesManager.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 11/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MyFilesManager.h"

@implementation MyFilesManager

- (void)saveFile:(NSString *)fileName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *myURL = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    [myURL URLByAppendingPathComponent:fileName];
}

@end
