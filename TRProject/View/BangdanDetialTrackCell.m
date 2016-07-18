//
//  BangdanDetialCell.m
//  TRProject
//
//  Created by kfc on 16/7/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BangdanDetialTrackCell.h"

@implementation BangdanDetialTrackCell
#pragma mark - 懒加载
- (UILabel *)countLab {
    if(_countLab == nil) {
        _countLab = [[UILabel alloc] init];
        [self.contentView addSubview:_countLab];
        [_countLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imageV.mas_bottom);
            make.left.equalTo(self.titleLab);
        }];
        _countLab.textColor = [UIColor grayColor];
    }
    return _countLab;
}

- (UILabel *)midLab {
    if(_midLab == nil) {
        _midLab = [[UILabel alloc] init];
        [self.contentView addSubview:_midLab];
        [_midLab mas_makeConstraints:^(MASConstraintMaker *make) {
            //  make.top.equalTo(self.titleLab.mas_bottom).equalTo(5);
            make.centerY.equalTo(0);
            make.left.equalTo(self.titleLab);
        }];
        _midLab.textColor = [UIColor grayColor];
    }
    return _midLab;
}

- (UILabel *)titleLab {
    if(_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageV);
            make.left.equalTo(self.imageV.mas_right).equalTo(5);
        }];
    }
    return _titleLab;
}

- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.equalTo(self.numlab.mas_right).equalTo(20);
            make.height.width.equalTo(80);
        }];
        _imageV.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageV;
}

- (UILabel *)numlab {
    if(_numlab == nil) {
        _numlab = [[UILabel alloc] init];
        [self.contentView addSubview:_numlab];
        [_numlab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(10);
        }];
        
    }
    return _numlab;
}
@end
