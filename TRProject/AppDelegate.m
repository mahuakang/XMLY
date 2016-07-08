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
#import "RecommendTableViewController.h"
#import "CategoryTableViewController.h"
#import "RadioTableViewController.h"
#import "ListTableViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    DiscorverPageController *disvc= [DiscorverPageController new];
    disvc.showOnNavigationBar =YES;
    disvc.menuViewStyle =0;
    disvc.menuBGColor =[UIColor clearColor];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:disvc];
    //    WMPageController *pagec = [[WMPageController alloc]initWithViewControllerClasses:@[[RecommendTableViewController class],[CategoryTableViewController class],[RadioTableViewController class],[ListTableViewController class]] andTheirTitles:@[@"推荐",@"分类",@"广播",@"榜单"]];
    
    //    pagec.showOnNavigationBar=YES;
    //    pagec.menuViewStyle=1;
    //    pagec.menuHeight=45;
    
    self.window.rootViewController =navi;
    
    
    return YES;
}

@end
