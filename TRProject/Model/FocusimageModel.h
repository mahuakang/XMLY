//
//  FocusimageModel.h
//  TRProject
//
//  Created by kfc on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FocusimageModelFocusimages,FocusimageModelFocusimagesList;
@interface FocusimageModel : NSObject

@property (nonatomic, strong) FocusimageModelFocusimages *focusImages;


@end
@interface FocusimageModelFocusimages : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<FocusimageModelFocusimagesList *> *list;

@end

@interface FocusimageModelFocusimagesList : NSObject

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *shortTitle;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) BOOL isShare;

@property (nonatomic, assign) BOOL is_External_url;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *longTitle;

@end



