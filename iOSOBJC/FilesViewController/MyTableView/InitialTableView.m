//
//  InitialTableView.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 02/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "InitialTableView.h"

@implementation InitialTableView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self registerClass:MyTableViewCell.self forCellReuseIdentifier:@"files"];
    }
    return self;
}

@end
