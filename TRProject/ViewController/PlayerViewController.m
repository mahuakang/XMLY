//
//  PlayerViewController.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerViewCell.h"
#import "PlayerViewDetialCell.h"
@interface PlayerViewController ()

@end

@implementation PlayerViewController
#pragma mark - 方法
- (void)playFMWithPlayurl:(NSString *)playurl picurl:(NSString *)picurl coversmall:(NSString *)coversmall Title:(NSString *)Title detial:(NSString *)detial duraTime:(NSInteger)duraTime;{
    
    _playurl = playurl;
    _coversmall =coversmall;
    _Title =Title;
    _detial =detial;
    _imageUrl =picurl;
    _duraTime=duraTime;
    self.navigationItem.title = _Title;
    
    [self.tableView reloadData];
}

#pragma mark -  初始化
- (instancetype)initWithCustom{
    self = [super init];
    if (self) {
        UIBarButtonItem *arrbtn = [[UIBarButtonItem alloc]bk_initWithImage:[UIImage imageNamed:@"icon_radio_show"] style:UIBarButtonItemStyleDone handler:^(id sender) {
            
            [self.tabBarController setSelectedIndex:0];
            
        }];
        self.navigationItem.leftBarButtonItem =arrbtn;
        self.navigationItem.title = @"当前没有音乐，快去寻找吧";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_np_playnon"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_np_playnon"];
        
        
    }
    return self;
}

#pragma mark -  代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        PlayerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerViewCell" forIndexPath:indexPath];
        cell.avplay = [[AVPlayer alloc]initWithURL:_playurl.yx_URL];
        self.avplay = cell.avplay;
        [self.avplay play];
        if (!_imageUrl) { //省却形式的图片
            cell.imageV.image = [UIImage imageNamed:@"soundImage_bg"];
        }else{
            [cell.imageV setImageURL:_imageUrl.yx_URL];
        }
        [cell btn];
        cell.slider.minimumValue   = 0;
        cell.slider.maximumValue  = _duraTime;
        NSTimer *tim =[NSTimer bk_timerWithTimeInterval:1 block:^(NSTimer *timer) {
            cell.slider.value +=1;
        } repeats:YES] ;
        [[NSRunLoop currentRunLoop] addTimer:tim forMode:NSRunLoopCommonModes];
        return cell;
    }else if(indexPath.section==1){
        PlayerViewDetialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerViewDetialCell" forIndexPath:indexPath];
        [cell.bottomImage setImageURL:_coversmall.yx_URL];
        cell.bottomLb.text = _Title;
        cell.bottombottomLab.text = _detial;
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?kScreenW+50:100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [self.tableView registerClass:[PlayerViewDetialCell class] forCellReuseIdentifier:@"PlayerViewDetialCell"];
    [self.tableView registerClass:[PlayerViewCell class] forCellReuseIdentifier:@"PlayerViewCell"];
    // [self.tableView reloadData];
    
}
- (void)viewDidDisappear:(BOOL)animated{
    [self.avplay pause];
    self.avplay =nil;
}



@end
