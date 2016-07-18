//
//  CatrgoryDetialPageController.m
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CategoryDetialPageController.h"
#import "FirstPageTableViewController.h"
#import "OtherPageTableViewController.h"
#import "WMPageNumModel.h"
#import "NetManager.h"

@interface CategoryDetialPageController()
@property (nonatomic,strong)WMPageNumModel *mod;
@end

@implementation CategoryDetialPageController

#pragma mark -  初始化
- (instancetype)initWithId:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType{
    self =[super init];
    if (self) {
        self.menuViewStyle =1;
        self.menuHeight=45;
        self.menuItemWidth=kScreenW/5;
        self.menuBGColor =[UIColor clearColor];
        self.navigationItem.title = @"";
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"";
        self.navigationItem.backBarButtonItem = backbutton;
        _Id =Id;
        _statMoudle = statMoudle;
        _pageType = pageType;
        self.navigationItem.title = _statMoudle;
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [NetManager getWmPageNumById:_Id statMoudle:_statMoudle pageType:_pageType completionHandler:^(id model, NSError *error) {
        _mod = model;
        [self reloadData];
    }];
}
#pragma mark - WMPageController 代理方法
- (NSArray<NSString *> *)titles{
    NSMutableArray *tmparr = [NSMutableArray new];
    //[tmparr addObject:@"推荐"];
    for (WMPageNumModelCategoryinfoList *list in self.mod.list) {
        [tmparr addObject:list.tname];
    }
    return tmparr;
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    //    switch (index) {
    //        case 0:
    //            return [[FirstPageTableViewController alloc]initWithId:self.mod.list[index].category_id];
    //        default:
    return  [[OtherPageTableViewController alloc]initWithId:self.mod.list[index].category_id tagName:self.mod.list[index].tname andSuperType:_statMoudle];
    
    //  }
    
    //  return nil;
}

- (NSString *)menuView:(WMMenuView *)menu titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
@end
