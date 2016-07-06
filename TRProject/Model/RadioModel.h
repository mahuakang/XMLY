//
//  RadioModel.h
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioModelData,RadioModelCategories,RadioModelCategoriesLocalradios,RadioModelCategorieslocalRadiosPlayurl,RadioModelDataTopradios,RadioModelDatatopRadiosPlayurl;
@interface RadioModel : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) RadioModelData *data;

@end
@interface RadioModelData : NSObject

@property (nonatomic, strong) NSArray<RadioModelDataTopradios *> *topRadios;

@property (nonatomic, strong) NSArray<RadioModelCategories *> *categories;

@property (nonatomic, strong) NSArray<RadioModelCategoriesLocalradios *> *localRadios;

@property (nonatomic, copy) NSString *location;

@end

@interface RadioModelCategories : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *name;

@end

@interface RadioModelCategoriesLocalradios : NSObject

@property (nonatomic, strong) RadioModelCategorieslocalRadiosPlayurl *playUrl;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *programName;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger programScheduleId;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger fmUid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger programId;

@end

@interface RadioModelCategorieslocalRadiosPlayurl : NSObject

@property (nonatomic, copy) NSString *ts64;

@property (nonatomic, copy) NSString *aac24;

@property (nonatomic, copy) NSString *aac64;

@property (nonatomic, copy) NSString *ts24;

@end

@interface RadioModelDataTopradios : NSObject

@property (nonatomic, strong) RadioModelDatatopRadiosPlayurl *playUrl;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *programName;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger programScheduleId;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger fmUid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger programId;

@end

@interface RadioModelDatatopRadiosPlayurl : NSObject

@property (nonatomic, copy) NSString *ts64;

@property (nonatomic, copy) NSString *aac24;

@property (nonatomic, copy) NSString *aac64;

@property (nonatomic, copy) NSString *ts24;

@end

