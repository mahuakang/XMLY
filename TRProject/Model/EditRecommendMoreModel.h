//
//  EditRecommendMoreModel.h
//  TRProject
//
//  Created by kfc on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EditRecommendMoreModelList;
@interface EditRecommendMoreModel : NSObject

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<EditRecommendMoreModelList *> *list;

@property (nonatomic, assign) NSInteger ret;

@end
@interface EditRecommendMoreModelList : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, assign) NSInteger commentsCount;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, assign) NSInteger priceTypeId;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@end

