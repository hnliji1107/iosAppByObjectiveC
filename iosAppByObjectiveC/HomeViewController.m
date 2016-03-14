//
//  HomeViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "HomeViewController.h"

#import "MyCollectionViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //navigationController下，添加scrollView，会有64px的偏移，也就是导航条的高度
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //图片轮播
    float viewW = self.view.bounds.size.width;
    
    float scrollViewW = viewW;
    
    float scrollViewH = scrollViewW;
    
    float scrollViewX = (viewW - scrollViewW) / 2;
    
    float scrollViewY = 64;
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(scrollViewX, scrollViewY, scrollViewW, scrollViewH)];
    
    
    UIImageView *imageViewOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hezi0"]];
    
    imageViewOne.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    [self.scrollView addSubview:imageViewOne];
    
    
    UIImageView *imageViewTwo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hezi1"]];
    
    imageViewTwo.frame = CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    [self.scrollView addSubview:imageViewTwo];
    
    
    UIImageView *imageViewThree = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hezi2"]];
    
    imageViewThree.frame = CGRectMake(self.scrollView.frame.size.width*2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    [self.scrollView addSubview:imageViewThree];
    
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height);
    
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    self.scrollView.delegate = self;
    
    
    [self.view addSubview:self.scrollView];
    
    
    
    //轮播进度条
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((viewW-100)/2, scrollViewY+scrollViewH, 100, 50)];
    
    self.pageControl.numberOfPages = 3;
    
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    [self.view addSubview:self.pageControl];
    
    
    
    //跳转到收藏页面的按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((viewW-300)/2, scrollViewY+scrollViewH+70, 300, 50)];
    
    [button setTitle:@"查看我的收藏" forState:UIControlStateNormal];
    
    button.titleLabel.textColor = [UIColor redColor];
    
    button.backgroundColor = [UIColor blueColor];
    
    [button addTarget:self action:@selector(pushMyCollection:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}


- (void)pushMyCollection:(id)sender {
    
    UIViewController *myCollectionViewController = [[MyCollectionViewController alloc] init];
    
    [self.navigationController pushViewController:myCollectionViewController animated:YES];
    
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
