//
//  MyCollectionViewController.h
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@end
