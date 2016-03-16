//
//  OfferDetailViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/14.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "OfferDetailViewController.h"

@interface OfferDetailViewController ()

@end

@implementation OfferDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //读取当前offerDetail路径
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *detailUrl = [userDefaults objectForKey:@"offerDetailUrl"];
    
    NSURL *webPageUrl = [NSURL URLWithString:detailUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:webPageUrl];
    
    
    self.webView  = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
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
    
    self.activityIndicatorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    
    self.activityIndicatorView.frame = CGRectMake((self.view.bounds.size.width-80)/2, (self.view.bounds.size.height-80)/2, 80, 80);
    
    self.activityIndicatorView.color = [UIColor whiteColor];
    
    self.activityIndicatorView.layer.cornerRadius = 10;
    
    [self.activityIndicatorView startAnimating];
    
    
    //[self.view addSubview:self.activityIndicatorView];
    
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
    
    pageTitle = [pageTitle substringWithRange:NSMakeRange(0, 16)];
    
    self.title = pageTitle;
    
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
