//
//  CategoryModel.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[CategoryModelList class]};
}
@end
@implementation CategoryModelList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


