//
//  ListenListTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListenListTableViewController.h"
#import "NetManager.h"
#import "ListenListModel.h"
#import "ListenListHeadCell.h"
#import "ListenListListCell.h"

@interface ListenListTableViewController ()
@property (nonatomic,strong)ListenListModel *listenListModel;
@end

@implementation ListenListTableViewController
#pragma mark - UITabelView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section==0?1:self.listenListModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        ListenListHeadCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ListenListHeadCell" forIndexPath:indexPath];
        cell = [cell initWithList:_listenListModel.info];
        return cell;
    }else{
        ListenListListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListenListListCell" forIndexPath:indexPath];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?300:100;
}
#pragma mark -  初始化
- (instancetype)initWithList:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType{
    self = [super init];
    if (self) {
        _Id = Id;
        _statMoudle = statMoudle;
        _pageType = pageType;
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[ListenListHeadCell class] forCellReuseIdentifier:@"ListenListHeadCell"];
    [self.tableView registerClass:[ListenListListCell  class] forCellReuseIdentifier:@"ListenListListCell"];
    [NetManager getListenListList:_Id statMoudle:_statMoudle pageType:_pageType completionHandler:^(id model, NSError *error) {
        _listenListModel = model;
        [self.tableView reloadData];
    }];
}
@end
