//
//  MainTabBarViewController.m
//  TRProject
//
//  Created by kfc on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "PlayerViewController.h"
@interface MainTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarViewController
- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 60;
    tabFrame.origin.y = self.view.frame.size.height - 60;
    self.tabBar.frame = tabFrame;
}
#pragma mark - TabbarController 代理方法
//设置当在tabbar正常点击播放页时的动画
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController{
    if ([viewController.topViewController isKindOfClass:[PlayerViewController class]]) {
        CATransition* animation = [CATransition animation];
        [animation setDuration:0.2f];
        [animation setType:kCATransitionMoveIn];
        [animation setSubtype:kCATransitionFromTop];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [[self.view layer]addAnimation:animation forKey:@"switchView"];
    }
}
#pragma mark - Tabbar 代理方法

-(void)tabBar:(UITabBar*)atabBar didSelectItem:(UITabBarItem*)item
{
    CATransition* animation = [CATransition animation];
    [animation setDuration:0.1f];
    [animation setType:kCATransitionFade];
    [animation setSubtype:kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[self.view layer]addAnimation:animation forKey:@"switchView"];
}

//页面间点击 动画切换 ，非tabbar点击
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    if (selectedIndex == 0) {
        CATransition* animation = [CATransition animation];
        [animation setDuration:0.2f];
        [animation setType:kCATransitionMoveIn];
        [animation setSubtype:kCATransitionFromBottom];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [[self.view layer]addAnimation:animation forKey:@"switchView"];
    }else if(selectedIndex==2){
        CATransition* animation = [CATransition animation];
        [animation setDuration:0.2f];
        [animation setType:kCATransitionMoveIn];
        [animation setSubtype:kCATransitionFromTop];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [[self.view layer]addAnimation:animation forKey:@"switchView"];
    }
    
    [super setSelectedIndex:selectedIndex];
}

#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    self.delegate=self;
}

@end
