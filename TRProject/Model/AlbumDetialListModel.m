//
//  AlbumDetialList.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumDetialListModel.h"

@implementation AlbumDetialListModel

@end
@implementation AlbumDetialListModelData

@end


@implementation AlbumDetialListModelDataAlbum

@end


@implementation AlbumDetialListModelDataTracks
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[AlbumDetialListModelDataTracksList class]};
}
@end


@implementation AlbumDetialListModelDataTracksList

@end


@implementation AlbumDetialListModelDataUser

@end


