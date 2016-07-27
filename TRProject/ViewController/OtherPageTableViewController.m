//
//  OtherPageTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "OtherPageTableViewController.h"
#import "NetManager.h"
#import "WMOtherPageModel.h"
#import "ListenListListCell.h"
#import "AlbumTableViewController.h"
@interface OtherPageTableViewController()
@property (nonatomic,strong)WMOtherPageModel *otherModel;
@end

@implementation OtherPageTableViewController
#pragma mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.otherModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView.separatorStyle=NO;//去掉分隔线
    ListenListListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListenListListCell" forIndexPath:indexPath];
    [cell.imageV setImageURL:_otherModel.list[indexPath.row].albumCoverUrl290.yx_URL];
    cell.titleLab.text = _otherModel.list[indexPath.row].title;
    cell.midLab.text = _otherModel.list[indexPath.row].intro;
    cell.playCountsLab.text =_otherModel.list[indexPath.row].playsCounts>10000?[NSString stringWithFormat:@"%.1f万",_otherModel.list[indexPath.row].playsCounts/10000.0]:@(_otherModel.list[indexPath.row].playsCounts).stringValue;
    cell.tracksCounts.text = [NSString stringWithFormat:@"%ld集",_otherModel.list[indexPath.row].tracks];
    [cell bottonLine];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"ListenListListCell" configuration:^(ListenListListCell* cell) {
        [cell.imageV setImageURL:_otherModel.list[indexPath.row].albumCoverUrl290.yx_URL];
        cell.titleLab.text = _otherModel.list[indexPath.row].title;
        cell.midLab.text = _otherModel.list[indexPath.row].intro;
        cell.playCountsLab.text =_otherModel.list[indexPath.row].playsCounts>10000?[NSString stringWithFormat:@"%.1f万",_otherModel.list[indexPath.row].playsCounts/10000.0]:@(_otherModel.list[indexPath.row].playsCounts).stringValue;
        cell.tracksCounts.text = [NSString stringWithFormat:@"%ld集",_otherModel.list[indexPath.row].tracks];
        [cell bottonLine];
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AlbumTableViewController *album = [[AlbumTableViewController alloc]initWithList:_otherModel.list[indexPath.row].Id statMoudle:@"" pageType:[NSString stringWithFormat:@"%@_%@",_supertype,_tagName]];
    [self.navigationController pushViewController:album animated:YES];
}
#pragma mark -  初始化
- (instancetype)initWithId:(NSInteger)Id tagName:(NSString *)tagName andSuperType:(NSString*)supertype{
    self = [super init];
    if (self) {
        _Id = Id;
        _tagName = tagName;
        _supertype = supertype;
        
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[ListenListListCell class] forCellReuseIdentifier:@"ListenListListCell"];
    [NetManager getWMOtherPageById:_Id tagName:_tagName completionHandler:^(id model, NSError *error) {
        if (error) {
            NSLog(@"网络请求出错，请重新刷新");
        }else{
            _otherModel = model;
            [self.tableView reloadData];
        }
    }];
}
@end
