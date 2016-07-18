//
//  RadioCategoryModel.m
//  TRProject
//
//  Created by kfc on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RadioCategoryModel.h"

@implementation RadioCategoryModel

@end
@implementation RadioCategoryModelData
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[RadioCategoryModelDataData class]};
}
@end


@implementation RadioCategoryModelDataData
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"playUrl":[RadioCategoryModelDataDataPlayurl class]};
}
@end


@implementation RadioCategoryModelDataDataPlayurl

@end


