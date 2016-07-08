//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "NetManager.h"
#import "discoverViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    discoverViewController *disvc= [discoverViewController new];
    disvc.showOnNavigationBar =YES;
    disvc.menuViewStyle =0;
    disvc.menuBGColor =[UIColor clearColor];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:disvc];
    self.window.rootViewController =navi;
    
    return YES;
}

@end
