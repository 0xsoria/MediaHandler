//
//  Service.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 21/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "Service.h"

@implementation Service

- (void)fileDownloader:(NSString *)withURLString completion:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completion {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURL *url = [NSURL URLWithString:withURLString];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        completion(data, error);
        
    }];
    
    [dataTask resume];
}

@end
