//
//  SpecialListMoreModel.h
//  TRProject
//
//  Created by kfc on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpeicalListMoreModelList;
@interface SpecialListMoreModel : NSObject

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *moduleTitle;

@property (nonatomic, strong) NSArray<SpeicalListMoreModelList *> *list;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *msg;

@end
@interface SpeicalListMoreModelList : NSObject

@property (nonatomic, assign) NSInteger specialId;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *coverPathSmall;

@property (nonatomic, assign) NSInteger contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *footnote;

@property (nonatomic, copy) NSString *coverPathBig;

@property (nonatomic, assign) long long releasedAt;

@property (nonatomic, assign) BOOL isHot;

@end

