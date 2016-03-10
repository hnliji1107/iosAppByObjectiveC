//
//  HomeController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/2/23.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "HomeController.h"


@interface HomeController ()

@end


@implementation HomeController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    //图片轮播
    UIView *imageWrapperView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, [self.view bounds].size.width, 250)];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-340)/2, 30, 340, 200)];
    
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    
    for(int i = 1; i <= 5; i++) {

        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"d%d.jpg",i]];
        
        [images addObject:image];
        
    }
    
    self.imageView.animationImages = images;
    
    self.imageView.animationDuration = 10;
    
    [self.imageView startAnimating];
    
    [imageWrapperView addSubview:self.imageView];
    
    [self.view addSubview:imageWrapperView];
    
    
    
    //轮播进度条
    UIView *pageControlView = [[UIView alloc] initWithFrame:CGRectMake(0, 220, [self.view bounds].size.width, 80)];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-400)/2, 0, 400, 80)];
    
    pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    pageControl.numberOfPages = 5;
    
    pageControl.currentPage = 0;
    
    [pageControl addTarget:self action:@selector(todoPageControl:) forControlEvents:UIControlEventValueChanged];
    
    [pageControlView addSubview:pageControl];
    
    [self.view addSubview:pageControlView];
    

    
    //切换按钮
    UIView *switchWrapperView = [[UIView alloc] initWithFrame:CGRectMake(0, 280, [self.view bounds].size.width, 80)];
    
    UISwitch *switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake([self.view bounds].size.width-80, 0, 80, 30)];
    
    switchBtn.on = YES;
    
    [switchBtn addTarget:self action:@selector(todoSwitch:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"白天", @"黑夜"]];
    
    segmentControl.frame = CGRectMake(20, 0, 200, 30);
    
    segmentControl.selectedSegmentIndex = 0;
    
    [segmentControl addTarget:self action:@selector(todoSegmentControl:) forControlEvents:UIControlEventValueChanged];
    
    
    [switchWrapperView addSubview:segmentControl];
    
    [switchWrapperView addSubview:switchBtn];
    
    [self.view addSubview:switchWrapperView];
    
    
    
    //进度条
    UIView *progressWrapperView = [[UIView alloc] initWithFrame:CGRectMake(0, 330, [self.view bounds].size.width, 10)];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-340)/2, 0, 340, 5)];
    
    self.progressView.progressViewStyle = UIProgressViewStyleBar;
    
    self.progressView.progressTintColor = [UIColor redColor];
    
    self.progressView.trackTintColor = [UIColor darkGrayColor];
    
    self.progressView.progress = self.progress;
    
    [progressWrapperView addSubview:self.progressView];
    
    [self.view addSubview:progressWrapperView];
    
    
    
    //复选框(button模拟checkbox)
    UIView *checkboxWrapperView = [[UIView alloc] initWithFrame:CGRectMake(0, 340, [self.view bounds].size.width, 10)];
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *unselectedImage =[UIImage imageNamed:@"selection_button_checkbox_unselected"];
    
    UIImage *selectedImage =[UIImage imageNamed:@"selection_button_checkbox_selected"];
    
    checkbox.frame = CGRectMake([self.view bounds].size.width-80, 0, 80, 50);
    
    [checkbox setImage:unselectedImage forState:UIControlStateNormal];
    
    [checkbox setImage:selectedImage forState:UIControlStateSelected];
    
    [checkbox setSelected:YES];
    
    [checkbox addTarget:self action:@selector(todoCheckbox:) forControlEvents:UIControlEventTouchUpInside];
    
    [checkboxWrapperView addSubview:checkbox];
    
    [self.view addSubview:checkboxWrapperView];
    
    
    
    
    //滑动条
    UIView *sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, 410, [self.view bounds].size.width, 30)];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-340)/2, 0, 340, 30)];
    
    slider.minimumValue = 0;
    
    slider.maximumValue = 1;
    
    slider.value = 1;
    
    [slider addTarget:self action:@selector(todoSlider:) forControlEvents:UIControlEventValueChanged];
    
    
    [sliderView addSubview:slider];
    
    [self.view addSubview:sliderView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)todoSlider:(UISlider *)sender {
    
    self.imageView.alpha = sender.value;
    
}


- (void)todoPageControl:(UIPageControl *)sender {
    
    NSLog(@"%ld", (long)sender.currentPage);
    
}


- (void)todoSegmentControl:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        
    } else if (sender.selectedSegmentIndex == 1) {
        
        self.view.backgroundColor = [UIColor grayColor];
        
    }
    
}

- (void)todoSwitch:(UISwitch *)sender {
    
    self.progress = self.progress + 0.1;
    
    self.progressView.progress = self.progress;
    
    
    if (self.progress > 1) {
        
        self.progress = 0;
        
    }
    
    
    if (sender.on) {
        
        [self.imageView startAnimating];
        
    } else {
        
        [self.imageView stopAnimating];
        
    }
    
}

- (void)todoCheckbox:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}

@end
