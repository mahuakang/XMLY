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
- (NSArray<NSString *> *)titles{
    return @[@"推荐",@"分类",@"广播",@"榜单"];
}
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
