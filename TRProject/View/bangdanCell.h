//
//  bangdanCell.h
//  TRProject
//
//  Created by kfc on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
@interface bangdanCell : UITableViewCell
@property (nonatomic,strong)ListModelDatas *datas;
- (instancetype)initWithList:(ListModelDatas *)datas;

@end
