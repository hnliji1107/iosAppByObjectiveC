//
//  WeiTaoViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "WeiTaoViewController.h"

#import "AFHTTPSessionManager.h"

#import "AnotherItemCell.h"

#import "ItemModel.h"

#import "OfferDetailViewController.h"


@interface WeiTaoViewController ()

@end

@implementation WeiTaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AFHTTPSessionManager *httpSessionManager = [[AFHTTPSessionManager alloc] init];
    
    [httpSessionManager GET:@"http://h5.waptest.taobao.com/json/wv/items.json" parameters:@{@"param1": @"1", @"param2":@"2"} progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"progress");
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.dataDictionary = [responseObject objectForKey:@"items"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"failure");
        
    }];
    
    
    //创建数据列表
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//加载到tableView中的section数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}


//设置每个section呈现多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
}


//每行对应的数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //优先读取缓存
    AnotherItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnotherItemCell"];
    
    if (!cell) {
        
        cell = [[AnotherItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AnotherItemCell"];
        
    }
    
    
    [self.dataDictionary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        ItemModel *model = [[ItemModel alloc] init];
        
        model.imageUrl = [obj objectForKey:@"img"];
        
        model.title = [obj objectForKey:@"name"];
        
        model.price = [obj objectForKey:@"price"];
        
        
        //保存当前offerDetail路径
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:[obj objectForKey:@"url"] forKey:@"offerDetailUrl"];
        
        
        [cell updateCellWidthModel:model];
        
    }];
    
    
    return cell;
    
}


//设置每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 110;
    
}


//点击某行跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *offerDetailViewController = [[OfferDetailViewController alloc] init];
    
    [self.navigationController pushViewController:offerDetailViewController animated:YES];
    
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
