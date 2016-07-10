//
//  AlbumListCell.h
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumDetialListModel.h"
@interface AlbumListCell : UITableViewCell
@property (nonatomic,strong)AlbumDetialListModelDataTracksList *list;
- (instancetype)initWithList:(AlbumDetialListModelDataTracksList *)list;
@end
