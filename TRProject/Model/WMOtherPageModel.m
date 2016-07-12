//
//  WMOtherPageModel.m
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "WMOtherPageModel.h"

@implementation WMOtherPageModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[WMOtherPageModelList class]};
}
@end
@implementation WMOtherPageModelList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


