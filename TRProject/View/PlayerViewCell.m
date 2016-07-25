//
//  PlayerViewCell.m
//  TRProject
//
//  Created by kfc on 16/7/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PlayerViewCell.h"
@interface PlayerViewCell()
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIView *currentView;
@property (nonatomic,strong)UIView *totalView;
@end

@implementation PlayerViewCell
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self bottomView];
        [self btn];
        [self slider];
        [self currentView];
        [self totalView];
    }
    return self;
}
#pragma mark - 懒加载
- (UIView *)currentView {
    if(_currentView == nil) {
        _currentView = [[UIView alloc] init];
        [self.contentView addSubview:_currentView];
        [_currentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.bottom.equalTo(self.imageV).equalTo(-20);
            make.width.equalTo(50);
            make.height.equalTo(20);
        }];
        _currentView.backgroundColor = kRGBColor(1, 1, 1, 0.1);
    }
    return _currentView;
}

- (UILabel *)currenttimeLab {
    if(_currenttimeLab == nil) {
        _currenttimeLab = [[UILabel alloc] init];
        [self.currentView addSubview:_currenttimeLab];
        [_currenttimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.bottom.equalTo(self.currentView);
        }];
        _currenttimeLab.textColor = [UIColor whiteColor];
    }
    return _currenttimeLab;
}
- (UIView *)totalView {
    if(_totalView == nil) {
        _totalView = [[UIView alloc] init];
        [self.contentView addSubview:_totalView];
        [_totalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.bottom.equalTo(self.currenttimeLab);
            make.width.equalTo(50);
            make.height.equalTo(20);
        }];
        _totalView.backgroundColor = kRGBColor(1, 1, 1, 0.1);
    }
    return _totalView;
}
- (UILabel *)totaltimeLab {
    if(_totaltimeLab == nil) {
        _totaltimeLab = [[UILabel alloc] init];
        [self.totalView addSubview:_totaltimeLab];
        [_totaltimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.bottom.equalTo(self.currenttimeLab);
        }];
        _totaltimeLab.textColor = [UIColor whiteColor];
    }
    return _totaltimeLab;
}

- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [UIImageView new];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(0);
            make.width.height.equalTo(kScreenW);
        }];
        _imageV.contentMode = UIViewContentModeScaleToFill;
        
    }
    return _imageV;
}
- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        [self.contentView addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageV.mas_bottom);
            make.left.equalTo(0);
            make.width.equalTo(kScreenW);
            make.height.equalTo(50);
        }];
    }
    return _bottomView;
}

- (UISlider *)slider {
    if(_slider == nil) {
        _slider = [UISlider new];
        [self.contentView addSubview:_slider];
        [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.centerY.equalTo(self.bottomView.mas_top);
            make.width.equalTo(kScreenW);
        }];
        _slider.minimumTrackTintColor = [UIColor orangeColor];
        
    }
    return _slider;
}

- (UIButton *)btn {
    if(_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.height.width.equalTo(40);
        }];
        
    }
    return _btn;
}




@end
