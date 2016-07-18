//
//  BangdanDetialModel.h
//  TRProject
//
//  Created by kfc on 16/7/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BangdanDetialModelImages,BangdanDetialModelSharecontent,BangdanDetialModelList,BangdanDetialModelCategories;
@class Images,Sharecontent,List,Categories;
@interface BangdanDetialModel : NSObject

@property (nonatomic, strong) BangdanDetialModelSharecontent *shareContent;

@property (nonatomic, strong) NSArray<BangdanDetialModelCategories *> *categories;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger rankId;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<BangdanDetialModelList *> *list;

@property (nonatomic, strong) BangdanDetialModelImages *images;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger pageSize;

@end
@interface BangdanDetialModelImages : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *list;

@end

@interface BangdanDetialModelSharecontent : NSObject

@property (nonatomic, copy) NSString *picUrl;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *rowKey;

@property (nonatomic, assign) NSInteger lengthLimit;

@property (nonatomic, copy) NSString *shareType;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *weixinPic;

@property (nonatomic, copy) NSString *url;

@end

@interface BangdanDetialModelList : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger tracksCounts;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) NSInteger lastUptrackAt;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger priceTypeId;

@property (nonatomic, assign) NSInteger lastUptrackId;

@property (nonatomic, assign) NSInteger userSource;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, copy) NSString *playPath32;

@property (nonatomic, copy) NSString *playPath64;

@property (nonatomic, assign) long long createdAt;

@property (nonatomic, copy) NSString *playPathAacv224;

@property (nonatomic, copy) NSString *albumTitle;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, copy) NSString *playPathAacv164;

@property (nonatomic, assign) NSInteger sharesCounts;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger commentsCounts;

@property (nonatomic, assign) NSInteger favoritesCounts;

@end

@interface BangdanDetialModelCategories : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *key;

@property (nonatomic, copy) NSString *name;

@end






