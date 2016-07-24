//
//  BangdanDetialTableviewController.m
//  TRProject
//
//  Created by kfc on 16/7/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BangdanDetialTableviewController.h"
#import "BangdanDetialTrackCell.h"
#import "BangdanDetialAlbumCell.h"
#import "NetManager.h" 
#import "BangdanDetialModel.h"
#import "AlbumTableViewController.h"
@import AVKit;
@import AVFoundation;
@interface BangdanDetialTableviewController()
@property (nonatomic,strong)BangdanDetialModel *model;
@end
@implementation BangdanDetialTableviewController
#pragma mark - tableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_contentType isEqualToString:@"album"]) {
        BangdanDetialTrackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BangdanDetialTrackCell" forIndexPath:indexPath];
        cell.numlab.text = @(indexPath.row+1).stringValue;
        [cell.imageV setImageURL:self.model.list[indexPath.row].albumCoverUrl290.yx_URL];
        cell.titleLab.text = self.model.list[indexPath.row].title;
        cell.midLab.text = self.model.list[indexPath.row].nickname;
        cell.countLab.text = [NSString stringWithFormat:@"%ld集",self.model.list[indexPath.row].tracksCounts];
        switch (indexPath.row) {
            case 0:
                cell.numlab.textColor = [UIColor redColor];
                break;
            case 1:
                cell.numlab.textColor = [UIColor orangeColor];
                break;
            case 2:
                cell.numlab.textColor = [UIColor greenColor];
                break;
            default:
                cell.numlab.textColor = [UIColor grayColor];
                break;
        }
        return cell;
    }else if([_contentType isEqualToString:@"track"]){
        BangdanDetialAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BangdanDetialAlbumCell" forIndexPath:indexPath];
        cell.numLab.text = @(indexPath.row+1).stringValue;
        [cell.AlbumImage setImageURL:self.model.list[indexPath.row].coverSmall.yx_URL];
        cell.titleLab.text = self.model.list[indexPath.row].title;
        cell.midLab.text = self.model.list[indexPath.row].tags;
        switch (indexPath.row) {
            case 0:
                cell.numLab.textColor = [UIColor redColor];
                break;
            case 1:
                cell.numLab.textColor = [UIColor orangeColor];
                break;
            case 2:
                cell.numLab.textColor = [UIColor greenColor];
                break;
            default:
                cell.numLab.textColor = [UIColor grayColor];
                break;
        }
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_contentType isEqualToString:@"album"]) {
        AlbumTableViewController *alvc = [[AlbumTableViewController alloc]initWithList:self.model.list[indexPath.row].albumId statMoudle:@"" pageType:@""];
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"";
        self.navigationItem.backBarButtonItem = backbutton;
        [self.navigationController pushViewController:alvc animated:YES];
        
    }else if([_contentType isEqualToString:@"track"]){
        AVPlayerViewController *avc = [AVPlayerViewController new];
        avc.player = [AVPlayer playerWithURL:self.model.list[indexPath.row].playPath64.yx_URL];
        [avc.player play];
        [self presentViewController:avc animated:YES completion:nil];
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
#pragma mark -  初始化
- (instancetype)initWithType:(NSString *)contentType key:(NSString *)key{
    self = [super init];
    if (self) {
        _contentType = contentType;
        _key = key;
        
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[BangdanDetialTrackCell class] forCellReuseIdentifier:@"BangdanDetialTrackCell"];
    [self.tableView registerClass:[BangdanDetialAlbumCell class] forCellReuseIdentifier:@"BangdanDetialAlbumCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getBangdanDetialByType:_contentType key:_key completionHandler:^(id model, NSError *error) {
            if (error) {
                NSLog(@"网络请求出错，请重新刷新");
            }else{
                _model=model;
                self.navigationItem.title =self.model.title;
                [self.tableView.mj_header endRefreshing];
                [self.tableView reloadData];
            }
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}
@end
