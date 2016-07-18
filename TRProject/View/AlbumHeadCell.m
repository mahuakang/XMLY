//
//  AlbumHeadCell.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumHeadCell.h"
@interface AlbumHeadCell()

@end

@implementation AlbumHeadCell
#pragma mark -  初始化
- (instancetype)initWithList:(AlbumDetialListModelDataAlbum *)headdata{
    self = [super init];
    if (self) {
        _Headdata = headdata;
        
        
    }
    return self;
}
#pragma mark - 懒加载
- (UIImageView *)imagev {
    if(_imagev == nil) {
        _imagev = [[UIImageView alloc] init];
        [self.contentView addSubview:_imagev];
        [_imagev mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(10);
            make.width.height.equalTo(kScreenW/3);
            make.bottom.equalTo(-5);
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
- (UILabel *)titleLab {
    if(_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imagev.mas_right).equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(self.imagev);
        }];
        _titleLab.numberOfLines=2;
        _titleLab.font = [UIFont systemFontOfSize:18];
    }
    return _titleLab;
}

- (UILabel *)nickName {
    if(_nickName == nil) {
        _nickName = [[UILabel alloc] init];
        [self.contentView addSubview:_nickName];
        [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab);
            make.top.equalTo(self.titleLab.mas_bottom).equalTo(3);
        }];
        _nickName.textColor = [UIColor grayColor];
        _nickName.text = @"主播：";
    }
    return _nickName;
}

- (UIButton *)nickNameBtn {
    if(_nickNameBtn == nil) {
        _nickNameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_nickNameBtn];
        [_nickNameBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_nickNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nickName);
            make.left.equalTo(self.nickName.mas_right).equalTo(-7);
            make.height.equalTo(self.nickName);
            // make.width.equalTo(200);
        }];
    }
    return _nickNameBtn;
}

- (UILabel *)playTime {
    if(_playTime == nil) {
        _playTime = [[UILabel alloc] init];
        [self.contentView addSubview:_playTime];
        [_playTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab);
            make.top.equalTo(self.nickName.mas_bottom).equalTo(-4);
        }];
        _playTime.textColor = [UIColor grayColor];
    }
    return _playTime;
}

- (UILabel *)lastUpdateTime {
    if(_lastUpdateTime == nil) {
        _lastUpdateTime = [[UILabel alloc] init];
        [self.contentView addSubview:_lastUpdateTime];
        [_lastUpdateTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab);
            make.top.equalTo(self.playTime.mas_bottom).equalTo(3);
        }];
        _lastUpdateTime.textColor =  [UIColor grayColor];
    }
    return _lastUpdateTime;
}





@end
