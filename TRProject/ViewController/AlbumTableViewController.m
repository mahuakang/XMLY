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
        cell = [cell initWithList:self.adlModel.data.album];
        return cell;
    }else{
        AlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumListCell" forIndexPath:indexPath];
        cell = [cell initWithList:self.adlModel.data.tracks.list[indexPath.row]];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?200:80;
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
        
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[AlbumHeadCell class] forCellReuseIdentifier:@"AlbumHeadCell"];
    [self.tableView registerClass:[AlbumListCell class] forCellReuseIdentifier:@"AlbumListCell"];
    [NetManager getAlbumDetial:_albumUid statMoudle:_statMoudle pageType:_pageType ListcompletionHandler:^(id model, NSError *error) {
        self.adlModel = model;
        [self.tableView reloadData];
    } completionHandler:^(id model, NSError *error) {
        self.adModel = model;
        [self.tableView reloadData];
    }];
}
@end
