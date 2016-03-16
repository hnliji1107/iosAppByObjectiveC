//
//  FaXianViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "FaXianViewController.h"

@interface FaXianViewController ()

@end

@implementation FaXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置左侧按钮样式
    UIButton *lbButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [lbButton setImage:[UIImage imageNamed:@"iconfont-sourcecode"] forState:UIControlStateNormal];
    
    [lbButton setImage:[UIImage imageNamed:@"iconfont-sourcecode-highlight"] forState:UIControlStateHighlighted];
    
    [lbButton setFrame:CGRectMake(0, 0, 25, 25)];
    
    [lbButton addTarget:self action:@selector(todoRefresh:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lbButton];
    
    
    //设置右侧按钮样式
    UIButton *rbButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rbButton setImage:[UIImage imageNamed:@"iconfont-refresh"] forState:UIControlStateNormal];
    
    [rbButton setImage:[UIImage imageNamed:@"iconfont-refresh-highlight"] forState:UIControlStateHighlighted];
    
    [rbButton setFrame:CGRectMake(0, 0, 20, 20)];
    
    [rbButton addTarget:self action:@selector(todoRefresh:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rbButton];
    
    
    
    //如果我们在iOS9下直接进行HTTP请求，系统会告诉我们不能直接使用HTTP进行请求，
    //需要在Info.plist新增一段用于控制ATS的配置
    //<key>NSAppTransportSecurity</key>
    //<dict>
    //  <key>NSAllowsArbitraryLoads</key>
    //  <true/>
    //</dict>
    
    self.webView  = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSURL *webPageUrl = [NSURL URLWithString:@"http://m.1688.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:webPageUrl];
    
    [self.webView loadRequest:request];
    
    self.webView.delegate = self;
    
    [self.view addSubview:self.webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//页面加载开始前的回调
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //添加loading
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    self.activityIndicatorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];

    self.activityIndicatorView.frame = CGRectMake((self.view.bounds.size.width-80)/2, (self.view.bounds.size.height-80)/2, 80, 80);
    
    self.activityIndicatorView.color = [UIColor whiteColor];
    
    self.activityIndicatorView.layer.cornerRadius = 10;
    
    [self.activityIndicatorView startAnimating];
    
    
    [self.view addSubview:self.activityIndicatorView];
    
    return YES;
    
}


//已经开始加载的回调
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}


//加载完成的回调
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    //移除loading
    [self.activityIndicatorView stopAnimating];
    
    
    //更新title
    NSString *pageTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    self.title = pageTitle;
    
    self.parentViewController.tabBarItem.title = @"微淘";
    
}


//加载失败的回调
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
}


//页面刷新
- (void)todoRefresh:(id)sender {
    
    [self.webView stringByEvaluatingJavaScriptFromString:@"location.reload()"];
    
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
