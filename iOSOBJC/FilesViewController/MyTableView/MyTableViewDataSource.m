//
//  MyTableViewDataSource.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 11/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MyTableViewDataSource.h"
#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

@implementation MyTableViewDataSource

- (instancetype)initWithItems:(NSMutableArray *)items {
    if (self = [super init]) {
        self.items = items;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.items count] == 0) {
        return 0;
    } else {
        return [self.items count];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"files" forIndexPath:indexPath];
    NSURL *itemByIndex = [self.items objectAtIndex:indexPath.row];
    NSString *fileName = [itemByIndex lastPathComponent];
    
    [cell cellConfig: fileName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *indexes = [NSArray arrayWithObject:indexPath];
        
        [tableView beginUpdates];
        [self.items removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
        
        [self.delegate didDeleteAnItemAtIndex:indexPath.row];
    }
}

@end
