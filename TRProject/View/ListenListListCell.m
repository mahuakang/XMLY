//
//  ListenListListCell.m
//  TRProject
//
//  Created by kfc on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListenListListCell.h"

@interface ListenListListCell ()

@end

@implementation ListenListListCell
#pragma mark -  初始化
- (instancetype)initWithList:(ListenListModelList *)list{
    self = [super init];
    if (self) {
        _list = list;
        [self.imageV setImageURL:_list.albumCoverUrl290.yx_URL];
        self.titleLab.text = _list.title;
        self.midLab.text = _list.intro;
        self.playCountsLab.text =_list.playsCounts>10000?[NSString stringWithFormat:@"%.1f万",_list.playsCounts/10000.0]:@(_list.playsCounts).stringValue;
        self.tracksCounts.text = [NSString stringWithFormat:@"%ld集",_list.tracksCounts];
        
    }
    return self;
};
#pragma mark - 懒加载
- (UILabel *)tracksCounts {
    if(_tracksCounts == nil) {
        _tracksCounts = [[UILabel alloc] init];
        [self.contentView addSubview:_tracksCounts];
        [_tracksCounts mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playCountsLab);
            make.left.equalTo(self.playCountsLab.mas_right).equalTo(10);
        }];
        _tracksCounts.textColor = [UIColor grayColor];
        _tracksCounts.font = [UIFont systemFontOfSize:13];
    }
    return _tracksCounts;
}

- (UILabel *)playCountsLab {
    if(_playCountsLab == nil) {
        _playCountsLab = [[UILabel alloc] init];
        [self.contentView addSubview:_playCountsLab];
        [_playCountsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.midLab.mas_bottom).equalTo(5);
            make.left.equalTo(self.midLab);
        }];
        _playCountsLab.textColor = [UIColor grayColor];
        _playCountsLab.font = [UIFont systemFontOfSize:13];
    }
    return _playCountsLab;
}

- (UILabel *)midLab {
    if(_midLab == nil) {
        _midLab = [[UILabel alloc] init];
        [self.contentView addSubview:_midLab];
        [_midLab mas_makeConstraints:^(MASConstraintMaker *make) {
            // make.top.equalTo(self.titleLab.mas_bottom).equalTo(5);
            make.centerY.equalTo(0);
            make.right.equalTo(-kScreenW/6);
            make.left.equalTo(self.imageV.mas_right).equalTo(10);
        }];
        _midLab.numberOfLines=1;
        _midLab.textColor = [UIColor grayColor];
        _midLab.font = [UIFont systemFontOfSize:13];
    }
    return _midLab;
}

- (UILabel *)titleLab {
    if(_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageV);
            make.right.equalTo(-kScreenW/6);
            make.left.equalTo(self.imageV.mas_right).equalTo(20);
        }];
        _titleLab.numberOfLines=1;
        _titleLab.font = [UIFont systemFontOfSize:18];
    }
    return _titleLab;
}

- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(5);
            make.bottom.equalTo(-5);
            make.height.width.equalTo(kScreenW/5);
        }];
        _imageV.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageV;
}

@end
