//
//  ItemCell.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/2/25.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

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
        
        
        float hotLabelX = priceLabelX;
        
        float hotLabelY = priceLabelY + priceLabelH + 8;
        
        float hotLabelW = priceLabelW;
        
        float hotLabelH = 20;
        
        
        self.hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(hotLabelX, hotLabelY, hotLabelW, hotLabelH)];
        
        self.hotLabel.font = [UIFont fontWithName:@"Arial" size:14];
        
        self.hotLabel.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.hotLabel];
        
        
        
        self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rdir"]];
        
        self.iconImageView.frame = CGRectMake(self.titleLabel.frame.origin.x+self.titleLabel.frame.size.width-20, self.priceLabel.frame.origin.y, 20, 20);
        
        [self.contentView addSubview:self.iconImageView];

        
    }
    
    return self;
        
}


- (void)updateCellWidthModel:(ItemModel *)model {

    self.itemImageView.image = [UIImage imageNamed:model.imageName];
    
    self.titleLabel.text = model.title;
    
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@", model.price];
    
    self.hotLabel.text = [NSString stringWithFormat:@"人气 %@", model.hot];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
