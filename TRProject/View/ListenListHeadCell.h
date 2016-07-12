//
//  ListListHeadCell.h
//  TRProject
//
//  Created by kfc on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListenListModel.h"
@interface ListenListHeadCell:UITableViewCell
@property (nonatomic,strong)ListenListModelInfo *info;
- (instancetype)initWithList:(ListenListModelInfo *)info;
@end
