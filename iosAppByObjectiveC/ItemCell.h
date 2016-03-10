//
//  ItemCell.h
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/2/25.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ItemModel.h"


@interface ItemCell : UITableViewCell

@property (nonatomic, strong) UIImageView *itemImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *hotLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

- (void)updateCellWidthModel:(ItemModel *)model;

@end
