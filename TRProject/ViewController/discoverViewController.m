//
//  discoverViewController.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "discoverViewController.h"
#import "RecommendTableViewController.h"
#import "CategoryTableViewController.h"
#import "RadioTableViewController.h"
#import "ListTableViewController.h"
@implementation discoverViewController
- (NSArray<NSString *> *)titles{
    return @[@"推荐",@"分类",@"广播",@"榜单"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    RecommendTableViewController *r = [[RecommendTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    return r;
}
- (NSString *)menuView:(WMMenuView *)menu titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
@end
