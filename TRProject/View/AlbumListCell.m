//
//  AlbumListCell.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumListCell.h"
@interface AlbumListCell()

@end

@implementation AlbumListCell

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
            make.right.equalTo(-kScreenW/5);
            make.top.equalTo(self.imageV);
        }];
    }
    return _titleLab;
}

- (UILabel *)playTimesLab {
    if(_playTimesLab == nil) {
        _playTimesLab = [[UILabel alloc] init];
        [self.contentView addSubview:_playTimesLab];
        [_playTimesLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab).equalTo(5);
            make.top.equalTo(self.titleLab.mas_bottom).equalTo(10);
            make.bottom.equalTo(-10);
        }];
        _playTimesLab.textColor = [UIColor grayColor];
    }
    return _playTimesLab;
}

- (UILabel *)duration {
    if(_duration == nil) {
        _duration = [[UILabel alloc] init];
        [self.contentView addSubview:_duration];
        [_duration mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playTimesLab);
            //     make.left.equalTo(self.playTimesLab.mas_right).equalTo(5);
            make.right.equalTo(self.commentsLab.mas_left).equalTo(-10);
        }];
        _duration.textColor = [UIColor grayColor];
    }
    return _duration;
}

- (UILabel *)commentsLab {
    if(_commentsLab == nil) {
        _commentsLab = [[UILabel alloc] init];
        [self.contentView addSubview:_commentsLab];
        [_commentsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playTimesLab);
            // make.left.equalTo(self.duration.mas_right).equalTo(5);
            make.centerX.equalTo(0).equalTo(30);
        }];
        _commentsLab.textColor = [UIColor grayColor];
    }
    return _commentsLab;
}

@end
