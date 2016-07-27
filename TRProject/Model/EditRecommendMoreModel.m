//
//  EditRecommendMoreModel.m
//  TRProject
//
//  Created by kfc on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "EditRecommendMoreModel.h"

@implementation EditRecommendMoreModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[EditRecommendMoreModelList class]};
}
@end
@implementation EditRecommendMoreModelList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


