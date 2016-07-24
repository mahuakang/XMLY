//
//  PlayerViewCell.h
//  TRProject
//
//  Created by kfc on 16/7/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVKit;
@import AVFoundation;

@interface PlayerViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imageV;
@property (nonatomic,assign)BOOL isplay;
@property (nonatomic,strong)UISlider *slider;
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)AVPlayer *avplay;

@end
