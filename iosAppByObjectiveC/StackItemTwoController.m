//
//  StackItemTwoController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/9.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "StackItemTwoController.h"

@interface StackItemTwoController ()

@end

@implementation StackItemTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"栈中的第二个view";
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-300)/2, (self.view.bounds.size.height-100)/2, 300, 100)];
    
    tipLabel.text = @"栈中的第二个view";
    
    tipLabel.font = [UIFont systemFontOfSize:30];
    
    tipLabel.backgroundColor = [UIColor redColor];
    
    tipLabel.textColor = [UIColor whiteColor];
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
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
