//
//  WMPageNumModel.m
//  TRProject
//
//  Created by kfc on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "WMPageNumModel.h"

@implementation WMPageNumModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[WMPageNumModelCategoryinfoList class]};
}
@end
@implementation WMPageNumModelCategoryinfo

@end


@implementation WMPageNumModelCategoryinfoList

@end


