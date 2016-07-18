//
//  ListCell.h
//  TRProject
//
//  Created by kfc on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioModel.h"

@interface ListCell : UITableViewCell
@property (nonatomic,strong)RadioModelData *data;
@property (nonatomic,assign)NSUInteger currentSection;
- (instancetype)initWithList:(RadioModelData *)data currentSection:(NSUInteger)currentSection;
@end

@interface RadiosCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imagev;
@property (nonatomic,strong)UILabel *topLab;
@property (nonatomic,strong)UILabel *midLab;
@property (nonatomic,strong)UILabel *bottomLab;
@end
