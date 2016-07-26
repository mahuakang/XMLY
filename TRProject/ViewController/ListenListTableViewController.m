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
#import "PlayerViewController.h"
#import "ListenListHeadView.h"

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
    tableView.separatorStyle=NO;
    if (indexPath.section==0) {
        ListenListHeadCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ListenListHeadCell" forIndexPath:indexPath];
        cell.imageV.image = [UIImage imageNamed:@"findsubject_cover"];
        cell.titleLab.text = _listenListModel.info.title;
        cell.intro.text = _listenListModel.info.intro;
        [cell.nickimage setImageURL:_listenListModel.info.smallLogo.yx_URL];
        cell.nickname.text = _listenListModel.info.nickname;
        [cell xiaobian];
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
            [cell bottonLine];
            return cell;
        }else if(_listenListModel.info.contentType==1){
            ListenListListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListenListListCell" forIndexPath:indexPath];
            [cell.imageV setImageURL:_listenListModel.list[indexPath.row].albumCoverUrl290.yx_URL];
            cell.titleLab.text = _listenListModel.list[indexPath.row].title;
            cell.midLab.text = _listenListModel.list[indexPath.row].intro;
            cell.playCountsLab.text =_listenListModel.list[indexPath.row].playsCounts>10000?[NSString stringWithFormat:@"%.1f万",_listenListModel.list[indexPath.row].playsCounts/10000.0]:@(_listenListModel.list[indexPath.row].playsCounts).stringValue;
            cell.tracksCounts.text = [NSString stringWithFormat:@"%ld集",_listenListModel.list[indexPath.row].tracksCounts];
            
            return cell;
        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return [tableView fd_heightForCellWithIdentifier:@"ListenListHeadCell" configuration:^(ListenListHeadCell* cell) {
            cell.titleLab.text = _listenListModel.info.title;
            cell.intro.text = _listenListModel.info.intro;
            [cell.nickimage setImageURL:_listenListModel.info.smallLogo.yx_URL];
            cell.nickname.text = _listenListModel.info.nickname;
            [cell xiaobian];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"ListenListListCell" configuration:^(ListenListListCell*  cell) {
            [cell.imageV setImageURL:_listenListModel.list[indexPath.row].albumCoverUrl290.yx_URL];
            cell.titleLab.text = _listenListModel.list[indexPath.row].title;
            cell.midLab.text = _listenListModel.list[indexPath.row].intro;
            cell.playCountsLab.text =_listenListModel.list[indexPath.row].playsCounts>10000?[NSString stringWithFormat:@"%.1f万",_listenListModel.list[indexPath.row].playsCounts/10000.0]:@(_listenListModel.list[indexPath.row].playsCounts).stringValue;
            cell.tracksCounts.text = [NSString stringWithFormat:@"%ld集",_listenListModel.list[indexPath.row].tracksCounts];
        }];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (_listenListModel.info.contentType==2) {
            ListenListModelList *list = self.listenListModel.list[indexPath.row];
            UINavigationController *navi =self.tabBarController.viewControllers[2];
            PlayerViewController *pv3 = (PlayerViewController*)navi.topViewController;
            [pv3 playFMWithPlayurl:list.playPath64 picurl:list.coverSmall coversmall:list.coverSmall Title:list.title nickname:list.nickname  detial:list.title duraTime:list.duration];
            [self.tabBarController setSelectedIndex:2];
        }else{
            AlbumTableViewController *atvc = [[AlbumTableViewController alloc]initWithList:self.listenListModel.list[indexPath.row].Id statMoudle:@"听单详情" pageType:@(_listenListModel.info.specialId).stringValue];
            [self.navigationController pushViewController:atvc animated:YES];
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section==0?0.1:30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }else{
        ListenListHeadView *head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ListenListHeadView"];
        head.contentView.backgroundColor = [UIColor whiteColor];
        head.lab.text = @"听单列表";
        head.imageV.image= [UIImage imageNamed:@"findsection_logo"];
        return head;
    }
}
#pragma mark -  初始化
- (instancetype)initWithList:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _Id = Id;
        _statMoudle = statMoudle;
        _pageType = pageType;
        self.navigationItem.title = @"听单详情";
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"";
        self.navigationItem.backBarButtonItem = backbutton;
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[ListenListHeadCell class] forCellReuseIdentifier:@"ListenListHeadCell"];
    [self.tableView registerClass:[ListenListListCell  class] forCellReuseIdentifier:@"ListenListListCell"];
    [self.tableView registerClass:[AlbumListCell  class] forCellReuseIdentifier:@"AlbumListCell"];
    [self.tableView registerClass:[ListenListHeadView class] forHeaderFooterViewReuseIdentifier:@"ListenListHeadView"];
    [NetManager getListenListList:_Id statMoudle:_statMoudle pageType:_pageType completionHandler:^(id model, NSError *error) {
        if (error) {
            NSLog(@"网络请求出错，请重新刷新");
        }else{
            _listenListModel = model;
            [self.tableView reloadData];
        }
    }];
}
@end
