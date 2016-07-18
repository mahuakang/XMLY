//
//  BangdanDetialAlbumCell.m
//  TRProject
//
//  Created by kfc on 16/7/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BangdanDetialAlbumCell.h"

@implementation BangdanDetialAlbumCell
#pragma mark - 懒加载
- (UILabel *)midLab {
    if(_midLab == nil) {
        _midLab = [[UILabel alloc] init];
        [self.contentView addSubview:_midLab];
        [_midLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).equalTo(10);
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
            make.top.equalTo(self.AlbumImage);
            make.left.equalTo(self.AlbumImage.mas_right).equalTo(10);
            make.right.equalTo(-kScreenW/7);
        }];
        _titleLab.numberOfLines=2;
    }
    return _titleLab;
}

- (UIImageView *)AlbumImage {
    if(_AlbumImage == nil) {
        _AlbumImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_AlbumImage];
        [_AlbumImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numLab.mas_right).equalTo(20);
            make.top.equalTo(10);
            make.height.width.equalTo(80);
        }];
        _AlbumImage.contentMode = UIViewContentModeScaleToFill;
        _AlbumImage.layer.cornerRadius=40;
        _AlbumImage.clipsToBounds=YES;
    }
    return _AlbumImage;
}

- (UILabel *)numLab {
    if(_numLab == nil) {
        _numLab = [[UILabel alloc] init];
        [self.contentView addSubview:_numLab];
        [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(10);
        }];
    }
    return _numLab;
}
@end
