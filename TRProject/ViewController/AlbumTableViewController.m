//
//  AblumTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumTableViewController.h"
#import "NetManager.h"
#import "AlbumDetialListModel.h"
#import "AlbumDetialModel.h"
#import "AlbumHeadCell.h"
#import "AlbumListCell.h"
@import AVKit;
@import AVFoundation;
@interface AlbumTableViewController()
@property (nonatomic,strong)AlbumDetialModel *adModel;
@property (nonatomic,strong)AlbumDetialListModel *adlModel;
@end

@implementation AlbumTableViewController
#pragma mark - TableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = self.adlModel.data.tracks.list.count;
    return section==0?1:num;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        AlbumHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumHeadCell" forIndexPath:indexPath];
        AlbumDetialListModelDataAlbum *_Headdata = self.adlModel.data.album;
        [cell.imagev setImageURL:_Headdata.coverOrigin.yx_URL];
        cell.titleLab.text = _Headdata.title;
        [cell.nickNameBtn setTitle:_Headdata.nickname forState:UIControlStateNormal];
        cell.playTime.text = [NSString stringWithFormat:@"播放: %@次",_Headdata.playTimes>10000?[NSString stringWithFormat:@"%.1f万",_Headdata.playTimes/10000.0]:@(_Headdata.playTimes).stringValue];
        NSDateFormatter *df= [NSDateFormatter new];
        df.dateFormat = @"yyyy-MM-dd";
        cell.lastUpdateTime.text = [NSString stringWithFormat:@"状态: %@更新",[df  stringFromDate:[NSDate dateWithTimeIntervalSince1970:_Headdata.lastUptrackAt/1000]]];
        return cell;
    }else{
        AlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumListCell" forIndexPath:indexPath];
        AlbumDetialListModelDataTracksList *_list=self.adlModel.data.tracks.list[indexPath.row];
        [cell.imageV setImageURL:_list.coverLarge.yx_URL];
        cell.titleLab.text = _list.title;
        cell.playTimesLab.text = _list.playtimes>10000?[NSString stringWithFormat:@"%.1f万",_list.playtimes/10000.0]:@(_list.playtimes).stringValue;
        cell.duration.text = _list.duration>60
        ?[NSString stringWithFormat:@"%@:%@",_list.duration/60>=10?@(_list.duration/60).stringValue:[NSString stringWithFormat:@"0%ld",_list.duration/60],_list.duration%60>=10?@(_list.duration%60).stringValue:[NSString stringWithFormat:@"0%ld",_list.duration%60]]
        :[NSString stringWithFormat:@"00:%ld",_list.duration];
        
        cell.commentsLab.text = @(_list.comments).stringValue;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return [tableView fd_heightForCellWithIdentifier:@"AlbumHeadCell" configuration:^(AlbumHeadCell * cell) {
            AlbumDetialListModelDataAlbum *_Headdata = self.adlModel.data.album;
            [cell.imagev setImageURL:_Headdata.coverOrigin.yx_URL];
            cell.titleLab.text = _Headdata.title;
            [cell.nickNameBtn setTitle:_Headdata.nickname forState:UIControlStateNormal];
            cell.playTime.text = [NSString stringWithFormat:@"播放: %@次",_Headdata.playTimes>10000?[NSString stringWithFormat:@"%.1f万",_Headdata.playTimes/10000.0]:@(_Headdata.playTimes).stringValue];
            NSDateFormatter *df= [NSDateFormatter new];
            df.dateFormat = @"yyyy-MM-dd";
            cell.lastUpdateTime.text = [NSString stringWithFormat:@"状态: %@更新",[df  stringFromDate:[NSDate dateWithTimeIntervalSince1970:_Headdata.lastUptrackAt/1000]]];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"AlbumListCell" configuration:^(AlbumListCell * cell) {
            AlbumDetialListModelDataTracksList *_list=self.adlModel.data.tracks.list[indexPath.row];
            [cell.imageV setImageURL:_list.coverLarge.yx_URL];
            cell.titleLab.text = _list.title;
            cell.playTimesLab.text = _list.playtimes>10000?[NSString stringWithFormat:@"%.1f万",_list.playtimes/10000.0]:@(_list.playtimes).stringValue;
            cell.duration.text = _list.duration>60
            ?[NSString stringWithFormat:@"%@:%@",_list.duration/60>=10?@(_list.duration/60).stringValue:[NSString stringWithFormat:@"0%ld",_list.duration/60],_list.duration%60>=10?@(_list.duration%60).stringValue:[NSString stringWithFormat:@"0%ld",_list.duration%60]]
            :[NSString stringWithFormat:@"00:%ld",_list.duration];
            cell.commentsLab.text = @(_list.comments).stringValue;
        }];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        AVPlayerViewController *avc = [AVPlayerViewController new];
        avc.player = [AVPlayer playerWithURL:self.adlModel.data.tracks.list[indexPath.row].playUrl64.yx_URL];
        
        [avc.player play];
        [self presentViewController:avc animated:YES completion:nil];
    }
}
#pragma mark -  初始化
- (instancetype)initWithList:(NSInteger)albumUid statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
        _albumUid = albumUid;
        _statMoudle = statMoudle;
        _pageType = pageType;
        self.navigationItem.title = @"专辑详情";
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[AlbumHeadCell class] forCellReuseIdentifier:@"AlbumHeadCell"];
    [self.tableView registerClass:[AlbumListCell class] forCellReuseIdentifier:@"AlbumListCell"];
    [NetManager getAlbumDetial:_albumUid statMoudle:_statMoudle pageType:_pageType ListcompletionHandler:^(id model, NSError *error) {
        if (error) {
            NSLog(@"网络请求出错，请重新刷新");
        }else{
            self.adlModel = model;
            [self.tableView reloadData];
        }
    } completionHandler:^(id model, NSError *error) {
        if (error) {
            NSLog(@"网络请求出错，请重新刷新");
        }else{
            self.adModel = model;
            [self.tableView reloadData];
        }
    }];
}
@end
