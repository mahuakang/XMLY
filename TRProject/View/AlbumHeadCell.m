//
//  AlbumHeadCell.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumHeadCell.h"
@interface AlbumHeadCell()
@property (nonatomic,strong)UIImageView *imagev;
@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *nickName;
@property (nonatomic,strong)UIButton *nickNameBtn;
@property (nonatomic,strong)UILabel *playTime;
@property (nonatomic,strong)UILabel *lastUpdateTime;
@end

@implementation AlbumHeadCell
#pragma mark -  初始化
- (instancetype)initWithList:(AlbumDetialListModelDataAlbum *)headdata{
    self = [super init];
    if (self) {
        _Headdata = headdata;
        [self.imagev setImageURL:_Headdata.coverOrigin.yx_URL];
        self.titleLab.text = _Headdata.title;
        [self.nickNameBtn setTitle:_Headdata.nickname forState:UIControlStateNormal];
        self.playTime.text = [NSString stringWithFormat:@"播放: %@次",_Headdata.playTimes>10000?[NSString stringWithFormat:@"%.1f万",_Headdata.playTimes/10000.0]:@(_Headdata.playTimes).stringValue];
        NSDateFormatter *df= [NSDateFormatter new];
        df.dateFormat = @"yyyy-MM-dd";
        self.lastUpdateTime.text = [NSString stringWithFormat:@"状态: %@更新",[df  stringFromDate:[NSDate dateWithTimeIntervalSince1970:_Headdata.lastUptrackAt/1000]]];
        
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
