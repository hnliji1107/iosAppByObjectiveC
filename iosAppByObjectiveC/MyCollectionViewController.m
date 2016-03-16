//
//  MyCollectionViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "MyCollectionViewController.h"

#import "SVPullToRefresh.h"

#import "ItemCell.h"

#import "OfferDetailViewController.h"


@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我收藏的宝贝";
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    
    //声明临时变量weakSelf，用于闭包
    //__weak MyCollectionViewController *weakSelf = self;
    
    
    //下拉刷新
    //[self.tableView addPullToRefreshWithActionHandler:^{
        
        // prepend data to dataSource, insert cells at top of table view
        // call [tableView.pullToRefreshView stopAnimating] when done
        //[weakSelf insertRowAtTop];
        
    //}];
    
    
    //加载更多
    //[self.tableView addInfiniteScrollingWithActionHandler:^{
        
        // append data to data source, insert new cells at the end of table view
        // call [tableView.infiniteScrollingView stopAnimating] when done
        //[weakSelf insertRowAtBottom];
        
    //}];
    
    
    //设置下拉刷新时的各种状态
    //[self.tableView.pullToRefreshView setTitle:@"下拉即可刷新" forState:SVPullToRefreshStateStopped];
    
    //[self.tableView.pullToRefreshView setTitle:@"释放即可刷新" forState:SVPullToRefreshStateTriggered];
    
    //[self.tableView.pullToRefreshView setTitle:@"加载中..." forState:SVPullToRefreshStateLoading];
    
    
    [self.view addSubview:self.tableView];
    
    
    //添加静态数据
    self.dataArray = [[NSMutableArray alloc] init];
    
    [self addData:10];
}


//静态列表数据
- (void)addData:(NSInteger)num {
    
    for (int i = 0; i < num; ++i) {
        
        [self.dataArray addObject:[self getOneItemModel:i]];
        
    }
    
}


//下拉刷新加载数据
- (void)insertRowAtTop {
    
    __weak MyCollectionViewController *weakSelf = self;

    int64_t delayInSeconds = 1.0;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [weakSelf.tableView beginUpdates];
        
        [weakSelf.dataArray insertObject:[weakSelf getOneItemModel:5] atIndex:0];
        
        [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
        
        [weakSelf.tableView endUpdates];

        [weakSelf.tableView.pullToRefreshView stopAnimating];

    });
    
}


//加载更多数据
- (void)insertRowAtBottom {
    
    __weak MyCollectionViewController *weakSelf = self;
    
    int64_t delayInSeconds = 1.0;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [weakSelf.tableView beginUpdates];
        
        [weakSelf.dataArray addObject:[weakSelf getOneItemModel:7]];
        
        [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:weakSelf.dataArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
        
        [weakSelf.tableView endUpdates];
        
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
        
    });
    
}



//获取单个item
- (ItemModel *)getOneItemModel:(NSInteger) index {
    
    ItemModel *itemModel = [[ItemModel alloc] init];
    
    itemModel.imageName = @"cell-image.jpg";
    
    itemModel.title = @"2016春季新款韩版镂空蕾丝红色长袖连衣裙复古女装蕾丝中长裙子";
    
    itemModel.price = [NSString stringWithFormat:@"%ld%ld.00", index+1, index+2];
    
    itemModel.hot = [NSString stringWithFormat:@"%ld%ld", index+1, index];
    
    return itemModel;
    
}


//加载到tableView中的section数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}


//设置每个section呈现多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}


//每行对应的数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //优先读取缓存
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    
    if (!cell) {
        
        cell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemCell"];
        
    }
    
    
    ItemModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell updateCellWidthModel:model];
    
    return cell;
    
}


//设置每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 110;
    
}


//指定某行是否可以删除，默认都可以
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}


//点击某行跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *offerDetailViewController = [[OfferDetailViewController alloc] init];
    
    [self.navigationController pushViewController:offerDetailViewController animated:YES];
    
}


//删除按钮文案
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"删除";
    
}


//同步删除之后的数据
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.dataArray removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
    }
    
}


//编辑类型，默认是删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
    
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
