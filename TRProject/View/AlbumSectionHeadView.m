//
//  AlbumSectionHeadView.m
//  TRProject
//
//  Created by kfc on 16/7/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumSectionHeadView.h"

@implementation AlbumSectionHeadView
#pragma mark - 懒加载
- (UILabel *)lab {
    if(_lab == nil) {
        
        _lab = [UILabel new];
        [self.contentView addSubview:_lab];
        [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
        }];
        _lab.textColor = [UIColor grayColor];
    }
    return _lab;
}
@end
