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
#import "UIImage+SetImageSize.h"
@interface PlayerViewController ()
@property (nonatomic,assign)NSInteger currenttime;
@property (nonatomic,assign)BOOL isplay;
@end

@implementation PlayerViewController{
    NSTimer *tim;
}
#pragma mark - 方法
- (void)playFMWithPlayurl:(NSString *)playurl picurl:(NSString *)picurl coversmall:(NSString *)coversmall Title:(NSString *)Title nickname:(NSString*)nickname detial:(NSString *)detial duraTime:(NSInteger)duraTime;{
    
    _playurl = playurl;
    _coversmall =coversmall;
    _Title =Title;
    _detial =detial;
    _imageUrl =picurl;
    _duraTime=duraTime;
    _nickname =nickname;
    
    self.navigationItem.title = _Title;
    //设置图片
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:_coversmall.yx_URL]];
    image = [image setSelfSize:CGSizeMake(32, 32)];
    image = [image cutImageWithRadius:16];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.image = image;
    
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
        
        self.avplay = [[AVPlayer alloc]initWithURL:_playurl.yx_URL];
        
        if (!_imageUrl) { //省却形式的图片
            cell.imageV.image = [UIImage imageNamed:@"soundImage_bg"];
        }else{
            [cell.imageV setImageURL:_imageUrl.yx_URL];
        }
        
        //每次reloaddata后初始化滑动条的值,并且给当前时间清空
        _currenttime = 0;
        cell.slider.value=_currenttime;
        cell.slider.minimumValue   = 0;
        cell.slider.maximumValue  = _duraTime;
        cell.currenttimeLab.text =@"00:00";
        
        //给滑动条和当前时间 设置定时修改
        [tim invalidate];
        tim = nil;
        tim =[NSTimer bk_timerWithTimeInterval:1 block:^(NSTimer *timer) {
            if (self.avplay.status ==AVPlayerStatusReadyToPlay) {
                [self.avplay play];
                cell.slider.value +=1;
                _currenttime+=1;
                cell.currenttimeLab.text= _currenttime >60
                ?[NSString stringWithFormat:@"%@:%@",_currenttime/60>=10?@(_currenttime/60).stringValue:[NSString stringWithFormat:@"0%ld",_currenttime/60],_currenttime%60>=10?@(_currenttime%60).stringValue:[NSString stringWithFormat:@"0%ld",_currenttime%60]]
                :_currenttime>=10?[NSString stringWithFormat:@"00:%ld",_currenttime]:[NSString stringWithFormat:@"00:0%ld",_currenttime];
            }
        } repeats:YES] ;
        [[NSRunLoop currentRunLoop] addTimer:tim forMode:NSRunLoopCommonModes];
        
        //设置cell的右个时间框
        cell.totaltimeLab.text =_duraTime >60
        ?[NSString stringWithFormat:@"%@:%@",_duraTime/60>=10?@(_duraTime/60).stringValue:[NSString stringWithFormat:@"0%ld",_duraTime/60],_duraTime%60>=10?@(_duraTime%60).stringValue:[NSString stringWithFormat:@"0%ld",_duraTime%60]]
        :[NSString stringWithFormat:@"00:%ld",_duraTime];
        
        //设置cell播放按键的点击方法，因为是复用所以需要先清空target
        [cell.btn setImage:[UIImage imageNamed:@"btn_prelisten_pause"] forState:UIControlStateNormal];
        [cell.btn removeAllTargets];
        [cell.btn bk_addEventHandler:^(UIButton * sender) {
            if(_isplay){
                [self.avplay pause];
                _isplay = NO;
                [tim setFireDate:[NSDate distantFuture]];
                [sender setImage:[UIImage imageNamed:@"playbtn"] forState:UIControlStateNormal];
            }else{
                [self.avplay play];
                _isplay =YES;
                [tim setFireDate:[NSDate date]];
                [sender setImage:[UIImage imageNamed:@"btn_prelisten_pause"] forState:UIControlStateNormal];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
        //设置cell 不能点击
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
    }else if(indexPath.section==1){
        PlayerViewDetialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerViewDetialCell" forIndexPath:indexPath];
        [cell.bottomImage setImageURL:_coversmall.yx_URL];
        cell.bottomLb.text = _nickname;
        cell.bottombottomLab.text = _detial;
        //设置cell 不能点击
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
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
    _isplay = YES;
}

@end
