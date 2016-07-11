//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "NetManager.h"
#import "DiscorverPageController.h"
#import "SubscibeController.h"
#import "PlayerViewController.h"
#import "DownloadListenController.h"
#import "MineTableViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    

    DiscorverPageController *disC= [[DiscorverPageController alloc]init];
    UINavigationController *disNavi = [[UINavigationController alloc]initWithRootViewController:disC];
    disNavi.navigationBar.tintColor=[UIColor redColor];
    
    
    SubscibeController *subC = [[SubscibeController alloc]init];
    UINavigationController *subNavi = [[UINavigationController alloc]initWithRootViewController:subC];
    
    DownloadListenController *downC = [[DownloadListenController alloc]init];
    UINavigationController *downNavi = [[UINavigationController alloc]initWithRootViewController:downC];
    
    MineTableViewController *mineC = [[MineTableViewController alloc]init];
    UINavigationController *mineNavi = [[UINavigationController alloc]initWithRootViewController:mineC];
    
    UITabBarController *tbc = [UITabBarController new];
    tbc.viewControllers = @[disNavi,subNavi,downNavi,mineNavi];
    
    self.window.rootViewController =tbc;
    
    
    return YES;
}

@end
