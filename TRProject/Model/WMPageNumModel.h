//
//  WMPageNumModel.h
//  TRProject
//
//  Created by kfc on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WMPageNumModelCategoryinfo,WMPageNumModelCategoryinfoList;
@interface WMPageNumModel : NSObject

@property (nonatomic, assign) BOOL hasRecommendedZones;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) WMPageNumModelCategoryinfo *categoryInfo;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<WMPageNumModelCategoryinfoList *> *list;

@property (nonatomic, assign) NSInteger ret;

@end
@interface WMPageNumModelCategoryinfo : NSObject

@property (nonatomic, assign) BOOL filterSupported;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger categoryType;

@property (nonatomic, copy) NSString *contentType;

@end

@interface WMPageNumModelCategoryinfoList : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, assign) NSInteger category_id;

@end

