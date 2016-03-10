//
//  WeiTaoController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/2/25.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "WeiTaoController.h"

@interface WeiTaoController ()

@end

@implementation WeiTaoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //图片轮播
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, [self.view bounds].size.width, [self.view bounds].size.width)];
    
    
    UIImageView *imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hezi0"]];
    
    imageView0.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    [self.scrollView addSubview:imageView0];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hezi1"]];
    
    imageView1.frame = CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    [self.scrollView addSubview:imageView1];
    
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hezi2"]];
    
    imageView2.frame = CGRectMake(self.scrollView.frame.size.width*2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    [self.scrollView addSubview:imageView2];
    
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height);
    
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.delegate = self;
    
    
    [self.view addSubview:self.scrollView];
    
    
    
    //轮播进度条
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-100)/2, self.scrollView.frame.origin.y+self.scrollView.frame.size.height, 100, 50)];
    
    self.pageControl.numberOfPages = 3;
    
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    [self.view addSubview:self.pageControl];
    
    
    
    //定时轮播
    // 定义一个NSTimer
    self.paintingTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(todoAutoCarousel:) userInfo:nil repeats:YES];
    
}


//图片自动轮播
- (void)todoAutoCarousel:(id)sender {
    
    float offsetX = self.scrollView.contentOffset.x + self.scrollView.frame.size.width;
    
    float offsetY = self.scrollView.contentOffset.y;
    
    
    if (offsetX >= self.scrollView.frame.size.width*3) {
        
        offsetX = 0;
        
    }
    
    
    [self.scrollView setContentOffset:CGPointMake(offsetX, offsetY)];
    
    //更新进度
    [self scrollViewDidEndDecelerating:self.scrollView];
    
}


- (void)scrollViewDidEndDecelerating:(id)sender {
    
    self.pageControl.currentPage = self.scrollView.contentOffset.x/self.scrollView.frame.size.width;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
