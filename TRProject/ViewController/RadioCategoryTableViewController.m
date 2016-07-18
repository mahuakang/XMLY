//
//  RadioCategoryTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RadioCategoryTableViewController.h"
#import "NetManager.h"
#import "ListCell.h"
#import "RadioCategoryModel.h"
@import AVKit;
@import AVFoundation;
@interface RadioCategoryTableViewController()
@property (nonatomic,strong)NSMutableArray <RadioCategoryModelDataData *>*list;
@property (nonatomic,assign)NSInteger pageNum;
@end

@implementation RadioCategoryTableViewController
#pragma mark - TableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RadiosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadiosCell" forIndexPath:indexPath];
    cell.topLab.text = self.list[indexPath.row].name;
    cell.midLab.text = [NSString stringWithFormat:@"正在直播:%@",self.list[indexPath.row].programName];
    cell.bottomLab.text = self.list[indexPath.row].playCount>10000?[NSString stringWithFormat:@"%.1f万人",self.list[indexPath.row].playCount/10000.0]: [NSString stringWithFormat:@"%ld人",self.list[indexPath.row].playCount];
    [cell.imagev setImageURL:self.list[indexPath.row].coverLarge.yx_URL];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *avc = [AVPlayerViewController new];
    avc.player = [AVPlayer playerWithURL:self.list[indexPath.row].playUrl.aac24.yx_URL];
    [avc.player play];
    [self presentViewController:avc animated:YES completion:nil];
}
#pragma mark -  初始化
- (instancetype)initWithId:(NSInteger)Id CategoryName:(NSString*)name{
    self = [super init];
    if (self) {
        _Id = Id;
        _name = name;
        self.navigationItem.title=_name;
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.tableView registerClass:[RadiosCell class] forCellReuseIdentifier:@"RadiosCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _pageNum =1;
        [NetManager getRadioCategoryListById:_Id Page:_pageNum completionHandler:^(RadioCategoryModel* model, NSError *error) {
            [self.list removeAllObjects];
            [self.list addObjectsFromArray:model.data.data];
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}
#pragma mark - 懒加载
- (NSMutableArray <RadioCategoryModelDataData *> *)list {
    if(_list == nil) {
        _list = [[NSMutableArray <RadioCategoryModelDataData *> alloc] init];
    }
    return _list;
}

@end
