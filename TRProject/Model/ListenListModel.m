//
//  ListListModel.m
//  TRProject
//
//  Created by kfc on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListenListModel.h"

@implementation ListenListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[ListenListModelList class]};
}
@end
@implementation ListenListModelInfo

@end


@implementation ListenListModelList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation ListenListModelListOrigin

@end


