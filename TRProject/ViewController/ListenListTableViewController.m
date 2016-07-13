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
#import "AlbumListCell.h"
#import "AlbumTableViewController.h"
@import AVKit;
@import AVFoundation;
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
        if (_listenListModel.info.contentType==2) {
            AlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumListCell" forIndexPath:indexPath];
            ListenListModelList *list =_listenListModel.list[indexPath.row];
            [cell.imageV setImageURL:list.coverSmall.yx_URL];
            cell.titleLab.text = list.title;
            cell.playTimesLab.text = list.playsCounts>10000?[NSString stringWithFormat:@"%.1f万", list.playsCounts/10000.0]:@( list.playsCounts).stringValue;
            cell.duration.text = list.duration>60
            ?[NSString stringWithFormat:@"%@:%@",list.duration/60>10?@(list.duration/60).stringValue:[NSString stringWithFormat:@"0%ld",list.duration/60],list.duration%60>10?@(list.duration%60).stringValue:[NSString stringWithFormat:@"0%ld",list.duration%60]]
            :[NSString stringWithFormat:@"00:%ld",list.duration];
            cell.commentsLab.text = @(list.commentsCounts).stringValue;
            return cell;
        }else if(_listenListModel.info.contentType==1){
            ListenListListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListenListListCell" forIndexPath:indexPath];
            cell = [cell initWithList:_listenListModel.list[indexPath.row]];
            return cell;
        }
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (_listenListModel.info.contentType==2) {
            AVPlayerViewController *avc = [AVPlayerViewController new];
            avc.player = [AVPlayer playerWithURL:self.listenListModel.list[indexPath.row].playPath64.yx_URL];
            [avc.player play];
            [self presentViewController:avc animated:YES completion:nil];
        }else{
            AlbumTableViewController *atvc = [[AlbumTableViewController alloc]initWithList:self.listenListModel.list[indexPath.row].Id statMoudle:@"听单详情" pageType:@(_listenListModel.info.specialId).stringValue];
            [self.navigationController pushViewController:atvc animated:YES];
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?400:100;
}
#pragma mark -  初始化
- (instancetype)initWithList:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType{
    self = [super initWithStyle:UITableViewStyleGrouped];
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
    [self.tableView registerClass:[AlbumListCell  class] forCellReuseIdentifier:@"AlbumListCell"];
    [NetManager getListenListList:_Id statMoudle:_statMoudle pageType:_pageType completionHandler:^(id model, NSError *error) {
        _listenListModel = model;
        [self.tableView reloadData];
    }];
}
@end
