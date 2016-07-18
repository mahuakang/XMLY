//
//  RadioCategoryModel.h
//  TRProject
//
//  Created by kfc on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioCategoryModelData,RadioCategoryModelDataData,RadioCategoryModelDataDataPlayurl;
@interface RadioCategoryModel : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) RadioCategoryModelData *data;

@end
@interface RadioCategoryModelData : NSObject

@property (nonatomic, strong) NSArray<RadioCategoryModelDataData *> *data;

@property (nonatomic, assign) NSInteger totalSize;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger page;

@end

@interface RadioCategoryModelDataData : NSObject

@property (nonatomic, strong) RadioCategoryModelDataDataPlayurl *playUrl;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger programScheduleId;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger fmUid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger programId;

@property (nonatomic,copy)NSString *programName;

@end

@interface RadioCategoryModelDataDataPlayurl : NSObject

@property (nonatomic, copy) NSString *ts64;

@property (nonatomic, copy) NSString *aac24;

@property (nonatomic, copy) NSString *aac64;

@property (nonatomic, copy) NSString *ts24;

@end

