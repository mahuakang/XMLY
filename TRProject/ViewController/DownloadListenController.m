//
//  DownloadListenController.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DownloadListenController.h"
@implementation DownloadListenController
#pragma mark -  初始化
- (instancetype)init{
    self = [super init];
    if (self) {
        self.menuViewStyle =1;
        self.menuHeight=45;
        self.menuItemWidth=kScreenW/3;
        self.menuBGColor =[UIColor clearColor];
        self.showOnNavigationBar = YES;
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_download_n"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_download_h"];
    }
    return self;
}
#pragma mark - 方法
- (NSArray<NSString *> *)titles{
    return @[@"专辑",@"声音",@"下载中"];
}
#pragma mark -  代理方法
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    
    return [UIViewController new];
}
- (NSString *)menuView:(WMMenuView *)menu titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
@end
