//
//  ListenListHeadView.m
//  TRProject
//
//  Created by kfc on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListenListHeadView.h"

@implementation ListenListHeadView
#pragma mark - 懒加载
- (UILabel *)lab {
    if(_lab == nil) {
        _lab = [[UILabel alloc] init];
        [self.contentView addSubview:_lab];
        [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(self.imageV.mas_right).equalTo(3);
        }];
        _lab.textColor = [UIColor grayColor];
    }
    return _lab;
}


- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.centerY.equalTo(0);
        }];
        
    }
    return _imageV;
}

@end
