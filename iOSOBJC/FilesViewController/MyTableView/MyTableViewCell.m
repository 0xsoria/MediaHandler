//
//  MyTableViewCell.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 11/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

//MARK: - Initializers

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor systemBackgroundColor]];
    }
    return self;
}

//MARK: - Methods

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)cellConfig:(NSString *)fileName {
    self.textLabel.text = fileName;
}

- (void)addViewsToCell {
    
}

@end
