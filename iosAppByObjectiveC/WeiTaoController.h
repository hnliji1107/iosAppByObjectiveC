//
//  WeiTaoController.h
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/2/25.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiTaoController : UIViewController<UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) UIPageControl *pageControl;

@property(nonatomic, strong) NSTimer *paintingTimer;

@end
