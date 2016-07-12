//
//  FirstPageTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FirstPageTableViewController.h"
#import "NetManager.h"
#import "WMFirstPageModel.h"
#import "SpecialListCell.h"
#import "ListenListListCell.h"
@interface FirstPageTableViewController()
@property (nonatomic,strong)WMFirstPageModel *firstPageModel;
@end

@implementation FirstPageTableViewController


#pragma mark -  初始化
- (instancetype)initWithId:(NSInteger)Id{
    self= [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _Id = Id;
        
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [NetManager getWMFirstPageById:_Id completionHandler:^(id model, NSError *error) {
        _firstPageModel = model;
        [self.tableView reloadData];
    }];
}
@end
