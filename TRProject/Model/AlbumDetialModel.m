//
//  AlbumDetial.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumDetialModel.h"

@implementation AlbumDetialModel

@end
@implementation AlbumDetialModelData

@end


@implementation AlbumDetialModelDataDetail

@end


@implementation AlbumDetialModelDataUser

@end


@implementation AlbumDetialModelDataRecs
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[AlbumDetialModelDataRecsList class]};
}
@end


@implementation AlbumDetialModelDataRecsList

@end


