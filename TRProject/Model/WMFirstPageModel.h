//
//  WMFirstPageModel.h
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WMFirstPageModelFocusimages,WMFirstPageModelFocusimagesList,WMFirstPageModelTags,WMFirstPageModelTagsList,WMFirstPageModelCategorycontents,WMFirstPageModelCategorycontentsList,WMFirstPageModelCategorycontentsListList,WMFirstPageModelCategorycontentsListListFirstkresults;
@interface WMFirstPageModel : NSObject

@property (nonatomic, strong) WMFirstPageModelTags *tags;

@property (nonatomic, strong) WMFirstPageModelCategorycontents *categoryContents;

@property (nonatomic, assign) BOOL hasRecommendedZones;

@property (nonatomic, strong) WMFirstPageModelFocusimages *focusImages;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger ret;

@end
@interface WMFirstPageModelFocusimages : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<WMFirstPageModelFocusimagesList *> *list;

@end

@interface WMFirstPageModelFocusimagesList : NSObject

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *shortTitle;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) BOOL isShare;

@property (nonatomic, assign) BOOL is_External_url;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *longTitle;

@end

@interface WMFirstPageModelTags : NSObject

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<WMFirstPageModelTagsList *> *list;

@end

@interface WMFirstPageModelTagsList : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, assign) NSInteger category_id;

@end

@interface WMFirstPageModelCategorycontents : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<WMFirstPageModelCategorycontentsList *> *list;

@end

@interface WMFirstPageModelCategorycontentsList : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<WMFirstPageModelCategorycontentsListList *> *list;

@property (nonatomic, assign) NSInteger moduleType;

@property (nonatomic, assign) BOOL hasMore;

@end

@interface WMFirstPageModelCategorycontentsListList : NSObject

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, assign) NSInteger top;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger period;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) NSInteger firstId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *key;

@property (nonatomic, copy) NSString *rankingRule;

@property (nonatomic, copy) NSString *firstTitle;

@property (nonatomic, strong) NSArray<WMFirstPageModelCategorycontentsListListFirstkresults *> *firstKResults;

@property (nonatomic, copy) NSString *calcPeriod;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, assign) NSInteger categoryId;

@end

@interface WMFirstPageModelCategorycontentsListListFirstkresults : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *contentType;

@end

