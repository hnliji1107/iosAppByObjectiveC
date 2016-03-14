//
//  LoginViewController.h
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, strong) UITextField *userNameField;

@property(nonatomic, strong) UITextField *passwordField;

@end
