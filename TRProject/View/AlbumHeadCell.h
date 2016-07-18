//
//  AlbumHeadCell.h
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumDetialListModel.h"
@interface AlbumHeadCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imagev;
@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *nickName;
@property (nonatomic,strong)UIButton *nickNameBtn;
@property (nonatomic,strong)UILabel *playTime;
@property (nonatomic,strong)UILabel *lastUpdateTime;
@property (nonatomic,strong)AlbumDetialListModelDataAlbum *Headdata;
- (instancetype)initWithList:(AlbumDetialListModelDataAlbum *)headdata;
@end
