//
//  NetManager.h
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetManager : NSObject
+ (instancetype)getDetialPageNumByCategory:(NSString *)categoryName SecondCategory:(NSString *)SecondName categoryType:(NSString*)categoryType completionHandler:(void(^)(id model,NSError*error))completionHandler;
+ (instancetype)getRecommendList:(void(^)(id model,NSError*error))completionHandler listcompletionHandler:(void(^)(id model,NSError*error))listcompletionHandler;
+ (instancetype)getCategoryList:(void(^)(id model,NSError*error))completionHandler;
+ (instancetype)getRadioList:(void(^)(id model,NSError*error))completionHandler;
+ (instancetype)getList:(void(^)(id model,NSError*error))completionHandler;
@end
