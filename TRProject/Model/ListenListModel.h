//
//  ListListModel.h
//  TRProject
//
//  Created by kfc on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListenListModelInfo,ListenListModelList,ListenListModelListOrigin;
@interface ListenListModel : NSObject

@property (nonatomic, strong) ListenListModelInfo *info;

@property (nonatomic, strong) NSArray<ListenListModelList *> *list;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger ret;

@end
@interface ListenListModelInfo : NSObject

@property (nonatomic, assign) NSInteger specialId;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *coverPathBig;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *smallLogo;

@property (nonatomic, copy) NSString *personalSignature;

@property (nonatomic, copy) NSString *intro;

@end

@interface ListenListModelList : NSObject

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, strong) ListenListModelListOrigin *origin;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) long long lastUptrackAt;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger tracksCounts;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@end

@interface ListenListModelListOrigin : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@end

