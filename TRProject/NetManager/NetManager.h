//
//  NetManager.h
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetManager : NSObject

+ (instancetype)getRecommendList:(void(^)(id model,NSError*error))completionHandler listcompletionHandler:(void(^)(id model,NSError*error))listcompletionHandler;

+ (instancetype)getCategoryList:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getRadioList:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getList:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getAlbumDetial:(NSInteger)albumId statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType ListcompletionHandler:(void(^)(id model,NSError*error))ListcompletionHandler completionHandler:(void(^)(id model,NSError*error))completionHandler;
+ (instancetype)getListenListList:(NSInteger)listenListId statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getWmPageNumById:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getWMFirstPageById:(NSInteger)Id completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getWMOtherPageById:(NSInteger)Id tagName:(NSString *)tagName completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getRadioCategoryListById:(NSInteger)Id Page:(NSInteger)page completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getBangdanDetialByType:(NSString* )type key:(NSString *)key completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getEditRecommendMoreModel:(NSInteger)page completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getSpecialListMorModel:(NSInteger)page completionHandler:(void(^)(id model,NSError*error))completionHandler;

+ (instancetype)getfocusimagecompletionHandler:(void(^)(id model,NSError*error))completionHandler;
@end
