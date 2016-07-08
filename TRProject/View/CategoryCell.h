//
//  CategoryCell.h
//  TRProject
//
//  Created by kfc on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"
@interface CategoryCell : UITableViewCell
@property (nonatomic,strong)NSArray <CategoryModelList *>*itemDetial;
- (instancetype)initWithList:(NSArray <CategoryModelList *>*)itemDetial;
@end
