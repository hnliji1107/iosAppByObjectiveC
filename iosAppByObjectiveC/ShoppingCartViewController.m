//
//  ShoppingCartViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    tempButton.frame = CGRectMake(100, 100, 200, 50);
    
    tempButton.layer.cornerRadius = 4;
    
    [tempButton setTitle:@"点击" forState:UIControlStateNormal];
    
    tempButton.backgroundColor = [UIColor redColor];
    
    tempButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    tempButton.titleLabel.tintColor = [UIColor blackColor];
    
    [tempButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [tempButton addTarget:self action:@selector(todoFindFile:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:tempButton];
    
    
    @autoreleasepool {
        
        __weak NSString *str = @"tempStr";
        
        __strong NSString *str2 = @"tempStr2";
        
        NSString *str3 = @"tempStr3";
        
        
        self.tempStr = str;
    
        self.tempStr2 = str2;
        
        self.tempStr3 = str3;
        
        
        NSLog(@"tempStr-%@ tempStr2-%@ tempStr3-%@", str, str2, str3);
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)todoFindFile:(id)sender {
    
//    NSString *filePath = [NSHomeDirectory()]
    
//    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
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
