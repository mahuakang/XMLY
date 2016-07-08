//
//  HorizontalItemCell.h
//  TRProject
//
//  Created by kfc on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"
@interface HorizontalItemCell : UITableViewCell
@property (nonatomic,strong)NSArray  <RecommendModelDiscoverColumnList *>*itemDetial;
- (instancetype)initWithArr:(NSArray <RecommendModelDiscoverColumnList *>*)itemDetial;
@end
