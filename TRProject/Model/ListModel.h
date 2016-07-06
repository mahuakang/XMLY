//
//  ListModel.h
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListModelFocusimages,ListModelFocusimagesList,ListModelDatas,ListModelDatasList,ListModelDatasListFirstkresults;
@interface ListModel : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) ListModelFocusimages *focusImages;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<ListModelDatas *> *datas;

@end
@interface ListModelFocusimages : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<ListModelFocusimagesList *> *list;

@end

@interface ListModelFocusimagesList : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger activityId;

@property (nonatomic, copy) NSString *shortTitle;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) BOOL isShare;

@property (nonatomic, assign) BOOL is_External_url;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *longTitle;

@end

@interface ListModelDatas : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<ListModelDatasList *> *list;

@property (nonatomic, assign) NSInteger ret;

@end

@interface ListModelDatasList : NSObject

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

@property (nonatomic, strong) NSArray<ListModelDatasListFirstkresults *> *firstKResults;

@property (nonatomic, copy) NSString *calcPeriod;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, assign) NSInteger categoryId;

@end

@interface ListModelDatasListFirstkresults : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *contentType;

@end

