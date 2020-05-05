//
//  MyTableViewCell.h
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 11/04/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property UIStackView *itemsStack;
@property UIImageView *itemImage;
@property UILabel *nameOfTheFileLabel;
@property UIProgressView *progressBar;

- (void)cellConfig:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
