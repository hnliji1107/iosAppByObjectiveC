//
//  MessagesViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/15.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息";
    
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-300)/2, 100, 300, 100)];
    
    tipLabel.backgroundColor = [UIColor redColor];
    
    tipLabel.textColor = [UIColor whiteColor];
    
    tipLabel.text = @"消息盒子";
    
    tipLabel.font = [UIFont systemFontOfSize:20];
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:tipLabel];
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
