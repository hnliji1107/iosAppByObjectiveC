//
//  LoginViewController.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/3/12.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"淘宝账户登录";
    
    
    //设置view背景色
    self.view.backgroundColor = [[UIColor alloc] initWithRed:.96 green:.96 blue:.96 alpha:1];
    

    //titleView
    CGRect titleViewRect = CGRectMake(0, 0, [self.view bounds].size.width, 60);
    
    UIView *titleView = [[UIView alloc] initWithFrame:titleViewRect];
    
    titleView.backgroundColor = [UIColor whiteColor];
    
    
    //title
    CGRect titleRect = CGRectMake(0, 26, [self.view bounds].size.width, 30);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleRect];
    
    titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    
    titleLabel.text = @"淘宝账户登录";
    
    titleLabel.textColor = [UIColor darkGrayColor];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    //add titleLabel
    [titleView addSubview:titleLabel];
    
    
    
    //help
    CGRect helpRect = CGRectMake([self.view bounds].size.width-40, 26, 40, 30);
    
    UILabel *helpLabel = [[UILabel alloc] initWithFrame:helpRect];
    
    helpLabel.font = [UIFont fontWithName:@"Arial" size:12];
    
    helpLabel.text = @"帮助";
    
    helpLabel.textColor = [UIColor darkGrayColor];
    
    helpLabel.textAlignment = NSTextAlignmentCenter;
    
    
    //add helpLabel
    [titleView addSubview:helpLabel];
    
    
    
    //backButton
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 32, 20, 20)];
    
    [backButton setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(todoBack:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //add backIcon
    [titleView addSubview:backButton];
    
    //add titleView
    [self.view addSubview:titleView];
    
    
    
    //userNameView
    CGRect userNameViewRect = CGRectMake(0, 76, [self.view bounds].size.width, 50);
    
    UIView *userNameView = [[UIView alloc] initWithFrame:userNameViewRect];
    
    userNameView.backgroundColor = [UIColor whiteColor];
    
    
    //userNameLabel
    CGRect userNameLabelRect = CGRectMake(15, 10, 80, 30);
    
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:userNameLabelRect];
    
    userNameLabel.text = @"账户";
    
    userNameLabel.textColor = [UIColor darkGrayColor];
    
    userNameLabel.font = [UIFont fontWithName:@"Arial" size:14];
    
    
    //userNameField
    CGRect userNameFieldRect = CGRectMake(100, 10, 200, 30);
    
    self.userNameField = [[UITextField alloc] initWithFrame:userNameFieldRect];
    
    self.userNameField.backgroundColor = [UIColor whiteColor];
    
    self.userNameField.placeholder = @"手机/会员名/邮箱";
    
    self.userNameField.font = [UIFont fontWithName:@"Arial" size:14];
    
    self.userNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.userNameField addTarget:self action:@selector(userNameDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    //使用UITextFieldDelegate
    self.userNameField.delegate = self;
    
    
    //add userNameLabel
    [userNameView addSubview:userNameLabel];
    
    //add userNameField
    [userNameView addSubview:self.userNameField];
    
    //add userNameView
    [self.view addSubview:userNameView];
    
    
    
    //passwordView
    CGRect passwordViewRect = CGRectMake(0, 127, [self.view bounds].size.width, 50);
    
    UIView *passwordView = [[UIView alloc] initWithFrame:passwordViewRect];
    
    passwordView.backgroundColor = [UIColor whiteColor];
    

    //passwordLabel
    CGRect passwordLabelRect = CGRectMake(15, 10, 80, 30);
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:passwordLabelRect];
    
    passwordLabel.text = @"登录密码";
    
    passwordLabel.textColor = [UIColor darkGrayColor];
    
    passwordLabel.font = [UIFont fontWithName:@"Arial" size:14];
    
    
    //passwordField
    CGRect passwordFieldRect = CGRectMake(100, 10, 200, 30);
    
    self.passwordField = [[UITextField alloc] initWithFrame:passwordFieldRect];
    
    self.passwordField.backgroundColor = [UIColor whiteColor];
    
    self.passwordField.placeholder = @"请输入密码";
    
    self.passwordField.font = [UIFont fontWithName:@"Arial" size:14];
    
    self.passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.passwordField.secureTextEntry = YES;
    
    [self.passwordField addTarget:self action:@selector(passwordDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    //使用UITextFieldDelegate
    self.passwordField.delegate = self;
    
    
    //add passwordLabel
    [passwordView addSubview:passwordLabel];
    
    //add passwordField
    [passwordView addSubview:self.passwordField];
    
    //add passwordView
    [self.view addSubview:passwordView];
    


    //loginBtnView
    CGRect loginBtnViewRect = CGRectMake(0, 195, [self.view bounds].size.width, 50);
    
    UIView *loginBtnView = [[UIView alloc] initWithFrame:loginBtnViewRect];
    
    
    //loginBtn
    CGRect loginBtnRect = CGRectMake(10, 0, [self.view bounds].size.width-20, 40);
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:loginBtnRect];
    
    loginBtn.backgroundColor = [UIColor redColor];
    
    [loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    loginBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:16];
    
    [loginBtn.layer setCornerRadius:5];
    
    [loginBtn addTarget:self action:@selector(todoLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //add loginBtn
    [loginBtnView addSubview:loginBtn];
    
    //add loginView
    [self.view addSubview:loginBtnView];
    
    

    //forgetPasswordView
    CGRect forgetPasswordViewRect = CGRectMake(0, 250, [self.view bounds].size.width, 30);
    
    UIView *forgetPasswordView = [[UIView alloc] initWithFrame:forgetPasswordViewRect];
    
    
    //alipayLoginLabel
    UILabel *alipayLoginLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 30)];
    
    alipayLoginLabel.text = @"支付宝帐号登录";
    
    alipayLoginLabel.font = [UIFont fontWithName:@"Arial" size:12];
    
    
    //forgetPasswordLabel
    CGRect forgetPasswordLabelRect = CGRectMake([forgetPasswordView bounds].size.width-60, 0, 50, 30);
    
    UILabel *forgetPasswordLabel = [[UILabel alloc] initWithFrame:forgetPasswordLabelRect];
    
    forgetPasswordLabel.text = @"忘记密码";
    
    forgetPasswordLabel.font = [UIFont fontWithName:@"Arial" size:12];
    
    
    //add alipayLoginLabel
    [forgetPasswordView addSubview:alipayLoginLabel];
    
    //add forgetPasswordLabel
    [forgetPasswordView addSubview:forgetPasswordLabel];
    
    //add forgetPasswordView
    [self.view addSubview:forgetPasswordView];
    
    
    
    //registBtnView
    CGRect registBtnViewRect = CGRectMake(0, 300, [self.view bounds].size.width, 50);
    
    UIView *registBtnView = [[UIView alloc] initWithFrame:registBtnViewRect];
    

    //registBtn
    CGRect registBtnRect = CGRectMake(([self.view bounds].size.width-120)/2, 0, 120, 40);
    
    UIButton *registBtn = [[UIButton alloc] initWithFrame:registBtnRect];
    
    [registBtn setTitle:@"免费注册" forState:UIControlStateNormal];
    
    [registBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    registBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:16];
    
    [registBtn.layer setCornerRadius:5];
    
    [registBtn.layer setBorderWidth:1];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){ 1, 0, 0, 1 });
    
    [registBtn.layer setBorderColor:colorref];
    
    [registBtn addTarget:self action:@selector(todoReigst:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //add registBtn
    [registBtnView addSubview:registBtn];
    
    //add registBtnView
    [self.view addSubview:registBtnView];
    
    
    //键盘弹出通知（系统通知）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //键盘收起通知（系统通知）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

  
//返回
- (void)todoBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController.tabBarController setSelectedIndex:0];
    
}


//点击屏幕空白处收起键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.userNameField resignFirstResponder];
    
    [self.passwordField resignFirstResponder];
    
}


//点击return收起键盘（实现UITextFieldDelegate协议方法）
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}


//键盘弹出通知回调
- (void)keyboardWillShow:(id)sender {
    
    NSLog(@"keyboardWillShow %@", sender);
    
}


//键盘收起通知回调
- (void)keyboardWillHide:(id)sender {
    
    NSLog(@"keyboardWillHide %@", sender);
    
}



//监控账户输入
- (void)userNameDidChange:(UITextField *)sender {
    
    NSLog(@"当前账户：%@", self.userNameField.text);
    
}


//监控密码输入
- (void)passwordDidChange:(UITextField *)sender {
    
    NSLog(@"当前密码：%@", self.passwordField.text);
    
}


//登录
- (void)todoLogin:(id)sender {
    
    NSString *tip = @"";
    
    NSString *userNameFieldText = self.userNameField.text;
    
    NSString *passwordFieldText = self.passwordField.text;
    
    
    if (userNameFieldText.length <= 0) {
        
        tip = @"请填写账户";
        
    } else if (passwordFieldText.length <= 0) {
        
        tip = @"请填写密码";
        
    } else {
        
        if ([userNameFieldText isEqualToString:@"admin"] && [passwordFieldText isEqualToString:@"123456"]) {
            
            tip = @"登录成功";
            
        } else {
            tip = @"账户和密码不匹配";
        }
        
    }
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录提示" message:tip preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


//注册
- (void)todoReigst:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册提示" message:@"注册功能尚未开发" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
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
