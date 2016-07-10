//
//  AlbumDetial.h
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AlbumDetialModelData,AlbumDetialModelDataDetail,AlbumDetialModelDataUser,AlbumDetialModelDataRecs,AlbumDetialModelDataRecsList;
@interface AlbumDetialModel : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) AlbumDetialModelData *data;

@property (nonatomic, copy) NSString *msg;

@end
@interface AlbumDetialModelData : NSObject

@property (nonatomic, strong) AlbumDetialModelDataDetail *detail;

@property (nonatomic, strong) AlbumDetialModelDataUser *user;

@property (nonatomic, strong) AlbumDetialModelDataRecs *recs;

@end

@interface AlbumDetialModelDataDetail : NSObject

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *introRich;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *intro;

@end

@interface AlbumDetialModelDataUser : NSObject

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger albums;

@property (nonatomic, assign) BOOL isFollowed;

@property (nonatomic, assign) BOOL isVerified;

@property (nonatomic, assign) NSInteger followings;

@property (nonatomic, copy) NSString *smallLogo;

@property (nonatomic, copy) NSString *personalSignature;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger followers;

@property (nonatomic, copy) NSString *ptitle;

@property (nonatomic, copy) NSString *personDescribe;

@end

@interface AlbumDetialModelDataRecs : NSObject

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<AlbumDetialModelDataRecsList *> *list;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@end

@interface AlbumDetialModelDataRecsList : NSObject

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *recSrc;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *recTrack;

@property (nonatomic, assign) NSInteger playsCounts;

@end

