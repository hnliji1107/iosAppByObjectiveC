//
//  AnotherItemCell.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/16.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "AnotherItemCell.h"

#import "UIImageView+WebCache.h"


@implementation AnotherItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90)];
        
        [self.contentView addSubview:self.itemImageView];
        
        
        float titleLabelX = self.itemImageView.frame.origin.x + self.itemImageView.frame.size.width + 10;
        
        float titleLabelY = self.itemImageView.frame.origin.y;
        
        float titleLabelW = [UIScreen mainScreen].bounds.size.width - titleLabelX - 10;
        
        float titleLabelH = 40;
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH)];
        
        self.titleLabel.numberOfLines = 0;
        
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        self.titleLabel.font = [UIFont fontWithName:@"Arial" size:14];
        
        self.titleLabel.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.titleLabel];
        
        
        float priceLabelX = titleLabelX;
        
        float priceLabelY = titleLabelY + titleLabelH;
        
        float priceLabelW = titleLabelW;
        
        float priceLabelH = 20;
        
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(priceLabelX, priceLabelY, priceLabelW, priceLabelH)];
        
        self.priceLabel.textColor = [UIColor redColor];
        
        self.priceLabel.font = [UIFont boldSystemFontOfSize:14];
        
        [self.contentView addSubview:self.priceLabel];
        
    }
    
    return self;
    
}


- (void)updateCellWidthModel:(ItemModel *)model {
    
    NSURL *imageUrl = [NSURL URLWithString:model.imageUrl];
    
    [self.itemImageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"iconfont-zhanwei"]];
    
    self.titleLabel.text = model.title;
    
    self.priceLabel.text = model.price;
    
}


- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
