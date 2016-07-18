//
//  BangdanDetialModel.m
//  TRProject
//
//  Created by kfc on 16/7/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BangdanDetialModel.h"

@implementation BangdanDetialModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[BangdanDetialModelList class],@"categories":[BangdanDetialModelCategories class]};
}
@end
@implementation BangdanDetialModelImages

@end


@implementation BangdanDetialModelSharecontent

@end


@implementation BangdanDetialModelList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation BangdanDetialModelCategories
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end



