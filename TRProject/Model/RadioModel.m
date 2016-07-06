//
//  RadioModel.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RadioModel.h"

@implementation RadioModel

@end
@implementation RadioModelData
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"Categories":[RadioModelCategories class],
             @"topRadios":[RadioModelDataTopradios class],
             @"localRadios":[RadioModelCategoriesLocalradios class]};
}
@end


@implementation RadioModelCategories
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation RadioModelCategoriesLocalradios
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation RadioModelCategorieslocalRadiosPlayurl

@end


@implementation RadioModelDataTopradios
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation RadioModelDatatopRadiosPlayurl

@end


