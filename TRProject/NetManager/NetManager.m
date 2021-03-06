//
//  NetManager.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NetManager.h"
#import "RecommendModel.h"
#import "CategoryModel.h"
#import "RadioModel.h"
#import "ListModel.h"
#import "WMPageNumModel.h"
#import "AlbumDetialModel.h"
#import "AlbumDetialListModel.h"
#import "ListenListModel.h"
#import "WMFirstPageModel.h"
#import "WMOtherPageModel.h"
#import "RadioCategoryModel.h"
#import "BangdanDetialModel.h"
#import "EditRecommendMoreModel.h"
#import "SpecialListMoreModel.h"
#import "FocusimageModel.h"
@implementation NetManager

//发现_推荐
+(instancetype)getRecommendList:(void (^)(id, NSError *))completionHandler listcompletionHandler:(void(^)(id model,NSError*error))listcompletionHandler{
    [self GET:RecommendListPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !listcompletionHandler?:listcompletionHandler([RecommendModelList parseJSON:jsonObject],error);
    }];
    return [self GET:RecommendPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([RecommendModel parseJSON:jsonObject],error);
    }];
}
//发现_分页
+ (instancetype)getCategoryList:(void (^)(id, NSError *))completionHandler{
    return [self GET:CatrgoryPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([CategoryModel parseJSON:jsonObject],error);
    }];
}
//发现_广播
+ (instancetype)getRadioList:(void (^)(id, NSError *))completionHandler{
    return [self GET:RadioPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([RadioModel parseJSON:jsonObject],error);
    }];
}
//发现_榜单
+ (instancetype)getList:(void (^)(id, NSError *))completionHandler{
    return [self GET:ListPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([ListModel parseJSON:jsonObject],error);
    }];
}
//专辑详情
+ (instancetype)getAlbumDetial:(NSInteger)albumId statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType ListcompletionHandler:(void (^)(id, NSError *))ListcompletionHandler completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *detialListPath = [NSString stringWithFormat:AblumDetialPathRight,albumId,albumId,statMoudle,pageType];
    NSString *detialPath = [NSString stringWithFormat:AblumDetialPathLeft,albumId,statMoudle,pageType];
    [self GET:[detialListPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !ListcompletionHandler?:ListcompletionHandler([AlbumDetialListModel parseJSON:jsonObject],error);
    }];
    return [self GET:[detialPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([AlbumDetialModel parseJSON:jsonObject],error);
    }];
}
//听单详情
+ (instancetype)getListenListList:(NSInteger)listenListId statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:ListenListPath,listenListId,listenListId,statMoudle,pageType];
    return [self GET:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([ListenListModel parseJSON:jsonObject],error);
    }];
}
//分类-分页详情数量
+ (instancetype)getWmPageNumById:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:WmNumPath,Id,statMoudle,statMoudle,pageType];
    return [self GET:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([WMPageNumModel parseJSON:jsonObject],error);
    }];
}
//分类-分页详情的第一页
+ (instancetype)getWMFirstPageById:(NSInteger)Id completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path =[NSString stringWithFormat:WmFirstPage,Id];
    return [self GET:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([WMFirstPageModel parseJSON:jsonObject],error);
    }];
}
//分类-分页详情其他页
+ (instancetype)getWMOtherPageById:(NSInteger)Id tagName:(NSString *)tagName completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:WmOtherPage,Id,tagName];
    return [self GET:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([WMOtherPageModel parseJSON:jsonObject],error);
    }];
}
//广播-各种台的详情页
+ (instancetype)getRadioCategoryListById:(NSInteger)Id Page:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path  = [NSString stringWithFormat:RadiocategoryPath,Id,page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([RadioCategoryModel parseJSON:jsonObject],error);
    }];
}
// 榜单-详情
+ (instancetype)getBangdanDetialByType:(NSString *)type key:(NSString *)key completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:bandanDetialPath,type,key];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([BangdanDetialModel parseJSON:jsonObject],error);
    }];
}
//推荐_小编推荐_更多
+ (instancetype)getEditRecommendMoreModel:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *Path = [NSString stringWithFormat:editRecommendMorePath,page];
    return [self GET:[Path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([EditRecommendMoreModel parseJSON:jsonObject],error);
    }];
}
//听单_更多
+ (instancetype)getSpecialListMorModel:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:specialListMorePath,page];
    return [self GET:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([SpecialListMoreModel parseJSON:jsonObject],error);
    }];
    
}
+ (instancetype)getfocusimagecompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:fucusimagePath];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([FocusimageModel parseJSON:jsonObject],error);
    }];
}
@end
