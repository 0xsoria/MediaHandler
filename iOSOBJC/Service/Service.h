//
//  Service.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 21/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTTPServiceProtocol <NSObject>

- (void)fileDownloader:(NSString *)withURLString completion:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_BEGIN

@interface Service : NSObject <HTTPServiceProtocol>

@end

NS_ASSUME_NONNULL_END
