//
//  AppDelegate.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/1/17.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"

#import "WeiTaoViewController.h"

#import "FaXianViewController.h"

#import "ShoppingCartViewController.h"

#import "WoDeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    
    //首页Navigation控制器
    UIViewController *homeViewController = [[HomeViewController alloc] init];
    
    [self setViewController:homeViewController andPageTitle:@"首页" andTabTitle:@"首页" andType:@"shouye"];
    
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    
    
    //微淘控Navigation控制器
    UIViewController *weiTaoViewController = [[WeiTaoViewController alloc] init];
    
    [self setViewController:weiTaoViewController andPageTitle:@"微淘" andTabTitle:@"微淘" andType:@"weitao"];
    
    UINavigationController *weiTaoNavigationController = [[UINavigationController alloc] initWithRootViewController:weiTaoViewController];
    
    
    
    //发现Navigation控制器
    UIViewController *faXianViewController = [[FaXianViewController alloc] init];
    
    [self setViewController:faXianViewController andPageTitle:@"发现" andTabTitle:@"发现" andType:@"faxian"];
    
    UINavigationController *faXianNavigationController = [[UINavigationController alloc] initWithRootViewController:faXianViewController];
    

    
    //购物车Navigation控制器
    UIViewController *shoppingCartViewController = [[ShoppingCartViewController alloc] init];
    
    [self setViewController:shoppingCartViewController andPageTitle:@"购物车" andTabTitle:@"购物车" andType:@"gouwuche"];
    
    UINavigationController *shoppingCartNavigationController = [[UINavigationController alloc] initWithRootViewController:shoppingCartViewController];
    
    
    
    //我的淘宝Navigation控制器
    UIViewController *woDeViewController = [[WoDeViewController alloc] init];
    
    [self setViewController:woDeViewController andPageTitle:@"我的淘宝" andTabTitle:@"我的淘宝" andType:@"wode"];
    
    UINavigationController *woDeNavigationController = [[UINavigationController alloc] initWithRootViewController:woDeViewController];
    
    

    //tabBar控制器
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    
    //设置tabBar选中时的文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    //调整tabBar底部文字大小
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
    //把多个navigaton控制器添加到tabBar控制器中
    tabBarController.viewControllers = @[homeNavigationController, weiTaoNavigationController, faXianNavigationController,
                                         shoppingCartNavigationController, woDeNavigationController];
    
    
    //创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //设置一个默认背景色（白色）
    self.window.backgroundColor = [UIColor whiteColor];
    
    //设置控制器为Window的根控制器
    self.window.rootViewController = tabBarController;
    
    //设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

//设置tabBar对应主页面
- (void)setViewController:(UIViewController *)viewController andPageTitle:(NSString *)pageTitle andTabTitle:(NSString *)tabTitle andType:(NSString *)type {
    
    viewController.view.backgroundColor = [UIColor whiteColor];
    
    viewController.title = pageTitle;
    
    viewController.tabBarItem.title = tabTitle;
    
    viewController.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"iconfont-%@", type]] imageWithRenderingMode:
                                           UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"iconfont-%@-selected", type]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    if ([type isEqualToString:@"faxian"]) {
        
        viewController.tabBarItem.badgeValue = @"new";
        
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
