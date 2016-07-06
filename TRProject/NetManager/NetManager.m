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
@implementation NetManager
+(instancetype)getRecommendList:(void (^)(id, NSError *))completionHandler listcompletionHandler:(void(^)(id model,NSError*error))listcompletionHandler{
    [self GET:RecommendListPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !listcompletionHandler?:listcompletionHandler([RecommendModelList parseJSON:jsonObject],error);
    }];
    return [self GET:RecommendPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([RecommendModel parseJSON:jsonObject],error);
    }];
}
+ (instancetype)getCategoryList:(void (^)(id, NSError *))completionHandler{
    return [self GET:CatrgoryPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([CategoryModel parseJSON:jsonObject],error);
    }];
}
+ (instancetype)getRadioList:(void (^)(id, NSError *))completionHandler{
    return [self GET:RadioPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([RadioModel parseJSON:jsonObject],error);
    }];
}
+ (instancetype)getList:(void (^)(id, NSError *))completionHandler{
    return [self GET:ListPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([ListModel parseJSON:jsonObject],error);
    }];
}
@end
