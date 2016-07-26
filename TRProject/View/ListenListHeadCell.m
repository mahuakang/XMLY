//
//  ListListHeadCell.m
//  TRProject
//
//  Created by kfc on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListenListHeadCell.h"

@implementation ListenListHeadCell
#pragma mark -  初始化
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self imageV];
    }
    return self;
}
#pragma mark - 懒加载
- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.equalTo(5);
            make.height.width.equalTo(50);
        }];
        
        _imageV.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageV;
}

- (UILabel *)titleLab {
    if(_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageV);
            make.right.equalTo(-5);
            make.left.equalTo(self.imageV.mas_right).equalTo(5);
        }];
        _titleLab.numberOfLines=2;
        _titleLab.font =[UIFont systemFontOfSize:20];
    }
    return _titleLab;
}

- (UILabel *)detialColumn {
    if(_detialColumn == nil) {
        _detialColumn = [[UILabel alloc] init];
        [self.contentView addSubview:_detialColumn];
        [_detialColumn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageV.mas_bottom).equalTo(5);
            make.centerX.equalTo(0);
        }];
        _detialColumn.textColor = [UIColor grayColor];
        _detialColumn .text = @"简介";
    }
    return _detialColumn;
}

- (UILabel *)intro {
    if(_intro == nil) {
        _intro = [[UILabel alloc] init];
        [self.contentView addSubview:_intro];
        [_intro mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV);
            make.right.equalTo(self.titleLab);
            make.top.equalTo(self.detialColumn.mas_bottom).equalTo(5);
        }];
        _intro.numberOfLines=0;
        _intro.textColor = [UIColor grayColor];
    }
    return _intro;
}

- (UILabel *)nickname {
    if(_nickname == nil) {
        _nickname = [[UILabel alloc] init];
        [self.contentView addSubview:_nickname];
        [_nickname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLab);
            make.top.equalTo(self.intro.mas_bottom).equalTo(20);
            
        }];
        _nickname.textColor = [UIColor grayColor];
    }
    return _nickname;
}

- (UILabel *)xiaobian {
    if(_xiaobian == nil) {
        _xiaobian = [[UILabel alloc] init];
        [self.contentView addSubview:_xiaobian];
        [_xiaobian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.nickimage.mas_left).equalTo(-5);
            make.top.equalTo(self.nickname);
        }];
        _xiaobian.text = @"小编:";
        _xiaobian.textColor = [UIColor grayColor];
    }
    return _xiaobian;
}

- (UIImageView *)nickimage {
    if(_nickimage == nil) {
        _nickimage = [[UIImageView alloc]init];
        [self.contentView addSubview:_nickimage];
        [_nickimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.nickname.mas_left).equalTo(-5);
            make.top.equalTo(self.nickname).equalTo(-3);
            make.height.width.equalTo(30);
            make.bottom.equalTo(-15);
        }];
        _nickimage.layer.cornerRadius = 15;
        _nickimage.clipsToBounds = YES;
        _nickimage.contentMode = UIViewContentModeScaleToFill;
    }
    return _nickimage;
}

@end
