//
//  HeadItemCell.h
//  TRProject
//
//  Created by kfc on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioModel.h"
@interface HeadItemCell : UITableViewCell
@property (nonatomic)NSArray <RadioModelCategories *>*categoriesData;
- (instancetype)initWithList:(RadioModelData *)data;
@end
