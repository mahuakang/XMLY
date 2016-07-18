//
//  ListCell.m
//  TRProject
//
//  Created by kfc on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListCell.h"

/*=======================RadiosCell begin=============================*/

@implementation RadiosCell
#pragma mark - 懒加载
- (UILabel *)bottomLab {
    if(_bottomLab == nil) {
        _bottomLab = [[UILabel alloc] init];
        [self.contentView addSubview:_bottomLab];
        _bottomLab.textColor = [UIColor grayColor];
        [_bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topLab);
            make.bottom.equalTo(self.imagev);
        }];
    }
    return _bottomLab;
}

- (UILabel *)midLab {
    if(_midLab == nil) {
        _midLab = [[UILabel alloc] init];
        [self.contentView addSubview:_midLab];
        _midLab.numberOfLines=1;
        _midLab.textColor = [UIColor grayColor];
        [_midLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topLab);
            make.right.equalTo(-5);
            make.top.equalTo(self.topLab.mas_bottom).equalTo(5);
        }];
    }
    return _midLab;
}

- (UILabel *)topLab {
    if(_topLab == nil) {
        _topLab = [[UILabel alloc] init];
        [self.contentView addSubview:_topLab];
        _topLab.numberOfLines=1;
        [_topLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imagev.mas_right).equalTo(10);
            make.right.equalTo(-5);
            make.top.equalTo(self.imagev);
        }];
    }
    return _topLab;
}

- (UIImageView *)imagev {
    if(_imagev == nil) {
        _imagev = [[UIImageView alloc] init];
        [self.contentView addSubview:_imagev];
        [_imagev mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(80);
            make.top.left.equalTo(5);
        }];
        _imagev.contentMode = UIViewContentModeScaleToFill;
        
        UIView *topv=[UIView new];
        [_imagev addSubview:topv];
        topv.backgroundColor = kRGBColor(230, 230, 230, 1);
        [topv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(_imagev);
            make.height.equalTo(1);
        }];
        
        UIView *leftv=[UIView new];
        [_imagev addSubview:leftv];
        leftv.backgroundColor =  kRGBColor(230, 230, 230, 1);
        [leftv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(_imagev);
            make.width.equalTo(1);
        }];
        
        UIView *rightv=[UIView new];
        [_imagev addSubview:rightv];
        rightv.backgroundColor =  kRGBColor(230, 230, 230, 1);
        [rightv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(_imagev);
            make.width.equalTo(1);
        }];
        
        UIView *bottonV=[UIView new];
        [_imagev addSubview:bottonV];
        bottonV.backgroundColor =  kRGBColor(230, 230, 230, 1);
        [bottonV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(_imagev);
            make.height.equalTo(1);
        }];
        
    }
    return _imagev;
}

@end
/*=======================RadiosCell end=============================*/
@import AVKit;
@import AVFoundation;
@interface ListCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *cellHeadView;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UITableView *tv;
@end

@implementation ListCell
#pragma mark - TableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RadiosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadiosCell" forIndexPath:indexPath];
    if (_currentSection==1) {
        _titleLab.text = @"午安 上海";
        //这里类名在解析的时候写错了
        RadioModelCategoriesLocalradios *radioDetial = self.data.localRadios[indexPath.row];
        cell.topLab.text = radioDetial.name;
        cell.midLab.text = [NSString stringWithFormat:@"正在直播:%@",radioDetial.programName];
        cell.bottomLab.text = radioDetial.playCount>10000?[NSString stringWithFormat:@"%.1f万人",radioDetial.playCount/10000.0]: [NSString stringWithFormat:@"%ld人",radioDetial.playCount];
        [cell.imagev setImageURL:radioDetial.coverLarge.yx_URL];
    }else{
        _titleLab.text = @"排行榜";
        RadioModelDataTopradios *radioDetial = self.data.topRadios[indexPath.row];
        cell.topLab.text = radioDetial.name;
        cell.midLab.text = [NSString stringWithFormat:@"正在直播:%@",radioDetial.programName];
        cell.bottomLab.text = radioDetial.playCount>10000?[NSString stringWithFormat:@"%.1f万人",radioDetial.playCount/10000.0]: [NSString stringWithFormat:@"%ld人",radioDetial.playCount];
        [cell.imagev setImageURL:radioDetial.coverLarge.yx_URL];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *avc = [AVPlayerViewController new];
    avc.player = [AVPlayer playerWithURL:self.data.topRadios[indexPath.row].playUrl.aac24.yx_URL];
    [avc.player play];
    [self.viewController presentViewController:avc animated:YES completion:nil];
}
#pragma mark -  初始化
- (instancetype)initWithList:(RadioModelData *)data currentSection:(NSUInteger)currentSection{
    self = [super init];
    if (self) {
        _data = data;
        _currentSection = currentSection;
        [self cellHeadView];
        [self tv];
    }
    return self;
}
#pragma mark - 懒加载
- (UIView *)cellHeadView {
    if(_cellHeadView == nil) {
        _cellHeadView = [[UIView alloc] init];
        [self.contentView addSubview:_cellHeadView];
        [_cellHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(5);
            make.height.equalTo(40);
        }];
        _titleLab = [UILabel new];
        [_cellHeadView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(20);
        }];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cellHeadView addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.centerY.equalTo(0);
        }];
        [_button setTitle:@"更多" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_button bk_addEventHandler:^(id sender) {
            NSLog(@"q");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _cellHeadView;
}

- (UITableView *)tv {
    if(_tv == nil) {
        _tv = [[UITableView alloc] init];
        [self.contentView addSubview:_tv];
        _tv.delegate = self;
        _tv.dataSource=self;
        _tv.scrollEnabled=NO;
        [_tv registerClass:[RadiosCell class] forCellReuseIdentifier:@"RadiosCell"];
        [_tv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellHeadView.mas_bottom);
            make.left.right.bottom.equalTo(0);
            
        }];
    }
    return _tv;
    
}


@end
