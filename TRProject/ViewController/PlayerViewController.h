//
//  PlayerViewController.h
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVKit;
@import AVFoundation;
@interface PlayerViewController : UITableViewController
@property (nonatomic,copy)NSString *coversmall;
@property (nonatomic,copy)NSString *Title;
@property (nonatomic,copy)NSString *detial;
@property (nonatomic,copy)NSString *imageUrl;
@property (nonatomic,strong)AVPlayer *avplay;
@property (nonatomic,strong)NSString *playurl;
@property (nonatomic,assign)NSInteger duraTime;

- (instancetype)initWithCustom;
- (void)playFMWithPlayurl:(NSString *)playurl picurl:(NSString *)picurl coversmall:(NSString *)coversmall Title:(NSString *)Title detial:(NSString *)detial duraTime:(NSInteger)duraTime;

@end
