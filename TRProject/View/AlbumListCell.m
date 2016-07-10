//
//  AlbumListCell.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumListCell.h"
@interface AlbumListCell()
@property (nonatomic,strong)UIImageView *imageV;
@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *playTimes;
@property (nonatomic,strong)UILabel *duration;
@property (nonatomic,strong)UILabel *comments;
@end

@implementation AlbumListCell
#pragma mark -  初始化
- (instancetype)initWithList:(AlbumDetialListModelDataTracksList *)list{
    self = [super init];
    if (self) {
        _list = list;
        [self.imageV setImageURL:_list.coverLarge.yx_URL];
        NSLog(@"%@",_list.smallLogo);
        self.titleLab.text = list.title;
        self.playTimes.text = _list.playtimes>10000?[NSString stringWithFormat:@"%.1f万",_list.playtimes/10000.0]:@(_list.playtimes).stringValue;
        self.duration.text = _list.duration>60
        ?[NSString stringWithFormat:@"%@:%@",_list.duration/60>10?@(_list.duration/60).stringValue:[NSString stringWithFormat:@"0%ld",_list.duration/60],_list.duration%60>10?@(_list.duration%60).stringValue:[NSString stringWithFormat:@"0%ld",_list.duration%60]]
        :[NSString stringWithFormat:@"00:%ld",_list.duration];
        self.comments.text = @(_list.comments).stringValue;
    }
    return self;
}
#pragma mark - 懒加载
- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(5);
            make.height.width.equalTo(kScreenW/8);
        }];
        _imageV.layer.cornerRadius =kScreenW/16;
        _imageV.clipsToBounds = YES;
        _imageV.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageV;
}

- (UILabel *)titleLab {
    if(_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLab];
        _titleLab.numberOfLines=2;
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV.mas_right).equalTo(10);
            make.right.equalTo(-kScreenW/4);
            make.top.equalTo(self.imageV);
        }];
    }
    return _titleLab;
}

- (UILabel *)playTimes {
    if(_playTimes == nil) {
        _playTimes = [[UILabel alloc] init];
        [self.contentView addSubview:_playTimes];
        [_playTimes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab);
            make.top.equalTo(self.titleLab.mas_bottom);
        }];
    }
    return _playTimes;
}

- (UILabel *)duration {
    if(_duration == nil) {
        _duration = [[UILabel alloc] init];
        [self.contentView addSubview:_duration];
        [_duration mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playTimes);
            make.left.equalTo(self.playTimes.mas_right).equalTo(5);
        }];
    }
    return _duration;
}

- (UILabel *)comments {
    if(_comments == nil) {
        _comments = [[UILabel alloc] init];
        [self.contentView addSubview:_comments];
        [_comments mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playTimes);
            make.left.equalTo(self.duration.mas_right).equalTo(5);
        }];
    }
    return _comments;
}

@end
