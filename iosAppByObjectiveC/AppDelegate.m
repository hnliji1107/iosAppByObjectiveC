//
//  AppDelegate.m
//  iosAppByObjectiveC
//
//  Created by shijun.lisj on 16/1/17.
//  Copyright © 2016年 shijun.lisj. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeController.h"

#import "WeiTaoController.h"

#import "FaXianController.h"

#import "LoginController.h"

#import "GouwucheController.h"

#import "StackItemOneController.h"

#import "StackItemTwoController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    
    //创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //tabBar控制器
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    //设置控制器为Window的根控制器
    self.window.rootViewController = tabBarController;
    
    
    
    //首页控制器
    UIViewController *shouyeController = [[HomeController alloc] init];
    
    shouyeController.tabBarItem.title = @"首页";
    
    shouyeController.tabBarItem.image = [[UIImage imageNamed:@"iconfont-shouye"] imageWithRenderingMode:
                                UIImageRenderingModeAlwaysOriginal];
    
    shouyeController.tabBarItem.selectedImage = [[UIImage imageNamed:@"iconfont-shouye-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //微淘控制器
    UIViewController *weitaoController = [[WeiTaoController alloc] init];
    
    weitaoController.tabBarItem.title = @"微淘";
    
    weitaoController.tabBarItem.image = [[UIImage imageNamed:@"iconfont-weitao"] imageWithRenderingMode:
                                UIImageRenderingModeAlwaysOriginal];
    
    weitaoController.tabBarItem.selectedImage = [[UIImage imageNamed:@"iconfont-weitao-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    
    //发现控制器
    UIViewController *faxianController = [[FaXianController alloc] init];
    
    faxianController.tabBarItem.title = @"发现";
    
    faxianController.tabBarItem.image = [[UIImage imageNamed:@"iconfont-faxian"] imageWithRenderingMode:
                                   UIImageRenderingModeAlwaysOriginal];
    
    faxianController.tabBarItem.selectedImage = [[UIImage imageNamed:@"iconfont-faxian-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //购物车控制器
    UIViewController *gouwucheController = [[GouwucheController alloc] init];
    
    UINavigationController *gouwucheNavController = [[UINavigationController alloc] initWithRootViewController:gouwucheController];
    
    gouwucheNavController.tabBarItem.title = @"购物车";
    
    gouwucheNavController.tabBarItem.image = [[UIImage imageNamed:@"iconfont-gouwuche"] imageWithRenderingMode:
                                              UIImageRenderingModeAlwaysOriginal];
    
    gouwucheNavController.tabBarItem.selectedImage = [[UIImage imageNamed:@"iconfont-gouwuche-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    StackItemOneController *stackItemOneController = [[StackItemOneController alloc] init];
    
    StackItemTwoController *stackItemTwoController = [[StackItemTwoController alloc] init];
    
    
    [gouwucheNavController pushViewController:stackItemOneController animated:true];
    
    [gouwucheNavController pushViewController:stackItemTwoController animated:true];
    
    
    
    
    //我的淘宝控制器
    UIViewController *wodeController = [[LoginController alloc] init];
    
    wodeController.view.backgroundColor = [[UIColor alloc] initWithRed:.96 green:.96 blue:.96 alpha:1];
    
    wodeController.tabBarItem.title = @"我的淘宝";
    
    wodeController.tabBarItem.image = [[UIImage imageNamed:@"iconfont-wode"] imageWithRenderingMode:
                                     UIImageRenderingModeAlwaysOriginal];
    
    wodeController.tabBarItem.selectedImage = [[UIImage imageNamed:@"iconfont-wode-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    


    //添加子控制器到ITabBarController中
    //第一种方式
    //    [tb addChildViewController:shouyeController];
    //    [tb addChildViewController:weitaoController];
    
    
    //第二种方式
    tabBarController.viewControllers = @[shouyeController, weitaoController, faxianController, gouwucheNavController, wodeController];
    
    
    //设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];
    
    
    return YES;
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
