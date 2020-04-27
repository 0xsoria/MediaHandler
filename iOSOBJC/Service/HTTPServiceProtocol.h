//
//  HTTPServiceProtocol.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 23/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HTTPServiceProtocol <NSObject>

@property NSURLSession * _Nonnull session;
- (void)fileDownloader:(NSString *_Nonnull)withURLString;

@end

NS_ASSUME_NONNULL_END
