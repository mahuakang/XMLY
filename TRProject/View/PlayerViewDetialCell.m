//
//  PlayerViewDetialCell.m
//  TRProject
//
//  Created by kfc on 16/7/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PlayerViewDetialCell.h"

@implementation PlayerViewDetialCell
#pragma mark - 懒加载
- (UIImageView *)bottomImage {
    if(_bottomImage == nil) {
        _bottomImage= [[UIImageView alloc]init];
        [self.contentView addSubview:_bottomImage];
        [_bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(10);
            make.height.width.equalTo(80);
        }];
        _bottomImage.contentMode = UIViewContentModeScaleToFill;
    }
    return _bottomImage;
}

- (UILabel *)bottomLb {
    if(_bottomLb == nil) {
        _bottomLb = [UILabel new];
        [self.contentView addSubview:_bottomLb];
        [_bottomLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.equalTo(self.bottomImage.mas_right).equalTo(10);
        }];
    }
    return _bottomLb;
}

- (UILabel *)bottombottomLab {
    if(_bottombottomLab == nil) {
        _bottombottomLab = [[UILabel alloc] init];
        [self.contentView addSubview:_bottombottomLab];
        [_bottombottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bottomLb);
            make.top.equalTo(self.bottomLb.mas_bottom).equalTo(20);
        }];
        _bottombottomLab.textColor = [UIColor grayColor];
    }
    return _bottombottomLab;
}
@end
