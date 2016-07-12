//
//  WMFirstPageModel.m
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "WMFirstPageModel.h"

@implementation WMFirstPageModel

@end


@implementation WMFirstPageModelFocusimages
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[WMFirstPageModelFocusimagesList class]};
}
@end


@implementation WMFirstPageModelFocusimagesList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation WMFirstPageModelTags
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[WMFirstPageModelTagsList class]};
}
@end


@implementation WMFirstPageModelTagsList

@end


@implementation WMFirstPageModelCategorycontents
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[WMFirstPageModelCategorycontentsList class]};
}
@end


@implementation WMFirstPageModelCategorycontentsList
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[WMFirstPageModelCategorycontentsListList class]};
}
@end


@implementation WMFirstPageModelCategorycontentsListList
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"firstKResults":[WMFirstPageModelCategorycontentsListListFirstkresults class]};
}
@end


@implementation WMFirstPageModelCategorycontentsListListFirstkresults
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


