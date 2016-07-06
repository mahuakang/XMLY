//
//  RecommendModel.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel

@end
@implementation RecommendModelDiscoverycolumns
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[RecommendModelDiscoverColumnList class]};
}
@end


@implementation RecommendModelDiscoverColumnList

@end


@implementation RecommendModelFocusimages
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[RecommendModelFoculsimagesList class]};
}
@end


@implementation RecommendModelFoculsimagesList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation RecommendModelSpecialcolumn
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[RecommendModelSpecialColumnList class]};
}
@end


@implementation RecommendModelSpecialColumnList

@end


@implementation RecommendModelEditorrecommendalbums
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[RecommendModeleditorRecommendAlbumsList class]};
}
@end


@implementation RecommendModeleditorRecommendAlbumsList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation RecommendModelList

@end


@implementation RecommendModelListHotrecommends
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[RecommendModelListHotrecommendsList class]};
}
@end


@implementation RecommendModelListHotrecommendsList
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[RecommendModelListHotrecommendsListList class]};
}
@end


@implementation RecommendModelListHotrecommendsListList

@end


