//
//  SpecialListMoreTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SpecialListMoreTableViewController.h"
#import "SpecialListCell.h"
#import "NetManager.h"
#import "SpecialListMoreModel.h"
#import "ListenListTableViewController.h"
@interface SpecialListMoreTableViewController ()
@property (nonatomic,strong)NSMutableArray <SpeicalListMoreModelList *>*arr;
@property (nonatomic,assign)NSInteger pageNum;
@end

@implementation SpecialListMoreTableViewController
#pragma mark -  初始化
- (instancetype)init{
    self = [super init];
    if (self) {
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"";
        self.navigationItem.backBarButtonItem = backbutton;
        self.navigationItem.title=@"精品听单";
    }
    return self;
}
#pragma mark - tableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    specialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"specialCell" forIndexPath:indexPath];
    [cell.imagev setImageURL:self.arr[indexPath.row].coverPathSmall.yx_URL];
    cell.topLab.text=self.arr[indexPath.row].title;
    cell.midLab.text = self.arr[indexPath.row].subtitle;
    cell.bottomLab.text  = self.arr[indexPath.row].footnote;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"specialCell" configuration:^(specialCell * cell) {
        [cell.imagev setImageURL:self.arr[indexPath.row].coverPathBig.yx_URL];
        cell.topLab.text=self.arr[indexPath.row].title;
        cell.midLab.text = self.arr[indexPath.row].subtitle;
        cell.bottomLab.text  = self.arr[indexPath.row].footnote;
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListenListTableViewController *lltvc = [[ListenListTableViewController alloc]initWithList:self.arr[indexPath.row].specialId statMoudle:self.arr[indexPath.row].title pageType:@"发现_推荐"];
    [self.navigationController pushViewController:lltvc animated:YES];
    
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[specialCell class] forCellReuseIdentifier:@"specialCell"];
    _pageNum=1;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getSpecialListMorModel:_pageNum completionHandler:^(SpecialListMoreModel * model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.arr removeAllObjects];
                [self.arr addObjectsFromArray:model.list];
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getSpecialListMorModel:++_pageNum completionHandler:^(SpecialListMoreModel * model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.arr addObjectsFromArray:model.list];
                [self.tableView reloadData];
                if (_pageNum==model.maxPageId) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
            }
        }];
    }];
}

#pragma mark - 懒加载
- (NSMutableArray <SpeicalListMoreModelList *> *)arr {
    if(_arr == nil) {
        _arr = [[NSMutableArray <SpeicalListMoreModelList *> alloc] init];
    }
    return _arr;
}

@end
