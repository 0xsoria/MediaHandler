//
//  MyTableViewDataSource.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 11/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyTableViewDataSourceDelegate <NSObject>

- (void)didDeleteAnItemAtIndex:(NSInteger)index;

@end

@interface MyTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (readwrite) NSMutableArray *items;
@property (weak) id <MyTableViewDataSourceDelegate> delegate;

- (instancetype)initWithItems:(NSArray *)items;

@end

NS_ASSUME_NONNULL_END
