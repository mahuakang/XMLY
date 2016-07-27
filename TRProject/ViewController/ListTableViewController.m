//
//  ListTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListTableViewController.h"
#import "ListModel.h"
#import "bangdanCell.h"
#import "NetManager.h"
#import "AutoWebView.h"
@interface ListTableViewController()
@property (nonatomic,strong)UIButton *headView;
@property (nonatomic,strong)UIImageView *headImage;
@property (nonatomic,strong)ListModel *listModel;
@end

@implementation ListTableViewController
#pragma mark - tableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    bangdanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bangdanCell" forIndexPath:indexPath];
    cell = [cell initWithList:self.listModel.datas[indexPath.section]];
    [_headImage setImageURL:self.listModel.focusImages.list.firstObject.pic.yx_URL];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?1340:440;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section==0?0:10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self headView];
    [self.tableView registerClass:[bangdanCell class]forCellReuseIdentifier:@"bangdanCell"];
    [NetManager getList:^(id model, NSError *error) {
        if (error) {
            NSLog(@"网络请求出错，请重新刷新");
        }else{
            _listModel = model;
            self.tableView.tableHeaderView = self.headView;
            [self.tableView reloadData];
        }
    }];
}
- (UIButton *)headView {
    if(_headView == nil) {
        _headView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kScreenW);
            make.height.equalTo(kScreenW/2);
            make.top.left.equalTo(0);
        }];
        [_headView bk_addEventHandler:^(id sender) {
            AutoWebView *web = [[AutoWebView alloc]initWithUrl:self.listModel.focusImages.list.firstObject.url];
            web.navigationItem.title =self.listModel.focusImages.list.firstObject.longTitle ;
            
            [self.navigationController pushViewController:web animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        
        _headImage = [UIImageView new];
        [_headView addSubview:_headImage];
        [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _headImage.contentMode = UIViewContentModeScaleToFill;
        
    }
    return _headView;
}

@end
