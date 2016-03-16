//
//  AnotherItemCell.h
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/16.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ItemModel.h"


@interface AnotherItemCell : UITableViewCell

@property (nonatomic, strong) UIImageView *itemImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *hotLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

- (void)updateCellWidthModel:(ItemModel *)model;

@end
