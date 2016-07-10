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
@property (nonatomic,strong)AlbumDetialListModelDataAlbum *Headdata;
- (instancetype)initWithList:(AlbumDetialListModelDataAlbum *)headdata;
@end
