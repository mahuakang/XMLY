//
//  DiscorverPageController.m
//  TRProject
//
//  Created by kfc on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DiscorverPageController.h"
#import "RecommendTableViewController.h"
#import "CategoryTableViewController.h"
#import "RadioTableViewController.h"
#import "ListTableViewController.h"
@implementation DiscorverPageController
#pragma mark -  初始化
- (instancetype)init{
    self= [super init];
    if (self) {
        self.menuViewStyle =1;
        self.menuHeight=45;
        self.menuItemWidth=kScreenW/4;
        self.menuBGColor =[UIColor clearColor];
        self.navigationItem.title = @"喜马拉雅FM";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_find_n"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_find_h"];
        [self.tabBarController hidesBottomBarWhenPushed];
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"";
        self.navigationItem.backBarButtonItem = backbutton;
    }
    return self;
}
#pragma mark - 方法
- (NSArray<NSString *> *)titles{
    return @[@"推荐",@"分类",@"广播",@"榜单"];
}
#pragma mark -  代理方法
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index) {
        case 0:
            return [[RecommendTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
        case 1 :
            return [[CategoryTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
        case 2:
            return [[RadioTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
        case 3 :
            return [[ListTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
            
    }
    
    return nil;
}
- (NSString *)menuView:(WMMenuView *)menu titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
@end
