//
//  CategoryModel.h
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CategoryModelList;
@interface CategoryModel : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<CategoryModelList *> *list;

@end
@interface CategoryModelList : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, assign) BOOL filterSupported;

@property (nonatomic, assign) BOOL isChecked;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL selectedSwitch;

@property (nonatomic, assign) NSInteger categoryType;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *name;

@end

