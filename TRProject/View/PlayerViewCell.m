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
@end

@implementation PlayerViewCell
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self bottomView];
        [self btn];
        [self slider];
    }
    return self;
}
#pragma mark - 懒加载
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
        _isplay = YES;
        [_btn setImage:[UIImage imageNamed:@"btn_prelisten_pause"] forState:UIControlStateNormal];
        [_btn bk_addEventHandler:^(UIButton * sender) {
            if(_isplay){
                [self.avplay pause];
                _isplay = NO;
                [sender setImage:[UIImage imageNamed:@"playbtn"] forState:UIControlStateNormal];
            }else{
                [self.avplay play];
                _isplay =YES;
                [sender setImage:[UIImage imageNamed:@"btn_prelisten_pause"] forState:UIControlStateNormal];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}








@end
