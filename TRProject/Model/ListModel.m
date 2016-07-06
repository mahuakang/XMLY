//
//  ListModel.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"datas":[ListModelFocusimages class]};
}
@end
@implementation ListModelFocusimages
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[ListModelFocusimagesList class]};
}
@end


@implementation ListModelFocusimagesList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation ListModelDatas
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[ListModelDatasList class]};
}
@end


@implementation ListModelDatasList
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"Firstkresults":[ListModelDatasListFirstkresults class]};
}
@end


@implementation ListModelDatasListFirstkresults
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


