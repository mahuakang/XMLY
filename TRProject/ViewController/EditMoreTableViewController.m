//
//  EditMoreTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "EditMoreTableViewController.h"
#import "NetManager.h"
#import "EditRecommendMoreModel.h"
#import "ListenListListCell.h"
#import "AlbumTableViewController.h"
@interface EditMoreTableViewController ()
@property (nonatomic,strong)NSMutableArray<EditRecommendMoreModelList* > *arr;
@property (nonatomic,assign)NSInteger pageNum;
@end

@implementation EditMoreTableViewController
#pragma mark -  初始化
- (instancetype)init{
    self = [super init];
    if (self) {
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"";
        self.navigationItem.backBarButtonItem = backbutton;
        self.navigationItem.title=@"小编推荐";
    }
    return self;
}
#pragma mark - tableview 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView.separatorStyle=NO;//去掉分隔线
    ListenListListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListenListListCell" forIndexPath:indexPath];
    [cell.imageV setImageURL:self.arr[indexPath.row].coverMiddle.yx_URL];
    cell.titleLab.text = self.arr[indexPath.row].title;
    cell.midLab.text = self.arr[indexPath.row].intro;
    cell.playCountsLab.text =self.arr[indexPath.row].playsCounts>10000?[NSString stringWithFormat:@"%.1f万",self.arr[indexPath.row].playsCounts/10000.0]:@(self.arr[indexPath.row].playsCounts).stringValue;
    cell.tracksCounts.text = [NSString stringWithFormat:@"%ld集",self.arr[indexPath.row].tracks];
    [cell bottonLine];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"ListenListListCell" configuration:^(ListenListListCell* cell) {
        [cell.imageV setImageURL:self.arr[indexPath.row].coverMiddle.yx_URL];
        cell.titleLab.text = self.arr[indexPath.row].title;
        cell.midLab.text = self.arr[indexPath.row].intro;
        cell.playCountsLab.text =self.arr[indexPath.row].playsCounts>10000?[NSString stringWithFormat:@"%.1f万",self.arr[indexPath.row].playsCounts/10000.0]:@(self.arr[indexPath.row].playsCounts).stringValue;
        cell.tracksCounts.text = [NSString stringWithFormat:@"%ld集",self.arr[indexPath.row].tracks];
        [cell bottonLine];
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AlbumTableViewController *album = [[AlbumTableViewController alloc]initWithList:self.arr[indexPath.row].Id statMoudle:@"" pageType:@""];
    [self.navigationController pushViewController:album animated:YES];
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ListenListListCell class] forCellReuseIdentifier:@"ListenListListCell"];
    
    _pageNum =1;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getEditRecommendMoreModel:_pageNum completionHandler:^(EditRecommendMoreModel* model, NSError *error) {
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
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [NetManager getEditRecommendMoreModel:++_pageNum completionHandler:^(EditRecommendMoreModel*  model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.arr addObjectsFromArray:model.list];
                [self.tableView reloadData];
                if (_pageNum == model.maxPageId) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
            }
        }];
    }];
    
}

#pragma mark - 懒加载
- (NSMutableArray<EditRecommendMoreModelList* > *)arr {
    if(_arr == nil) {
        _arr = [[NSMutableArray<EditRecommendMoreModelList* > alloc] init];
    }
    return _arr;
}

@end
