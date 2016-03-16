//
//  OfferDetailViewController.h
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/14.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferDetailViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic, strong) UIWebView *webView;

@property(nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end
