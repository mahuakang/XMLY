//
//  SpecialListCell.h
//  TRProject
//
//  Created by kfc on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"
@interface SpecialListCell : UITableViewCell
@property (nonatomic,strong)RecommendModelSpecialcolumn * specialColumn;
- (instancetype)initWithColumn:(RecommendModelSpecialcolumn *)specialcColumn;

@end
@interface specialCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imagev;
@property (nonatomic,strong)UILabel *topLab;
@property (nonatomic,strong)UILabel *midLab;
@property (nonatomic,strong)UILabel *bottomLab;
@end