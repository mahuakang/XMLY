//
//  RecommendModel.h
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendModelDiscoverycolumns,RecommendModelDiscoverColumnList,RecommendModelFocusimages,RecommendModelFoculsimagesList,RecommendModelSpecialcolumn,RecommendModelSpecialColumnList,RecommendModelEditorrecommendalbums,RecommendModeleditorRecommendAlbumsList;
@class RecommendModelListHotrecommends,RecommendModelListHotrecommendsList,RecommendModelListHotrecommendsListList;
@interface RecommendModel : NSObject

@property (nonatomic, strong) RecommendModelDiscoverycolumns *discoveryColumns;

@property (nonatomic, strong) RecommendModelFocusimages *focusImages;

@property (nonatomic, strong) RecommendModelSpecialcolumn *specialColumn;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) RecommendModelEditorrecommendalbums *editorRecommendAlbums;

@property (nonatomic, assign) NSInteger ret;

@end
@interface RecommendModelDiscoverycolumns : NSObject

@property (nonatomic, assign) NSInteger locationInHotRecommend;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<RecommendModelDiscoverColumnList *> *list;

@property (nonatomic, assign) NSInteger ret;

@end

@interface RecommendModelDiscoverColumnList : NSObject

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL enableShare;

@property (nonatomic, assign) BOOL isExternalUrl;

@property (nonatomic, copy) NSString *sharePic;

@property (nonatomic, copy) NSString *url;

@end

@interface RecommendModelFocusimages : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<RecommendModelFoculsimagesList *> *list;

@end

@interface RecommendModelFoculsimagesList : NSObject

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

@interface RecommendModelSpecialcolumn : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<RecommendModelSpecialColumnList *> *list;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, assign) NSInteger ret;

@end

@interface RecommendModelSpecialColumnList : NSObject

@property (nonatomic, assign) NSInteger specialId;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *footnote;

@property (nonatomic, assign) NSInteger columnType;

@end

@interface RecommendModelEditorrecommendalbums : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<RecommendModeleditorRecommendAlbumsList *> *list;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, assign) NSInteger ret;

@end

@interface RecommendModeleditorRecommendAlbumsList : NSObject

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger commentsCount;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *coverLarge;

@end

@interface RecommendModelList : NSObject



@property (nonatomic, strong) RecommendModelListHotrecommends *hotRecommends;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger ret;

@end

@interface RecommendModelListHotrecommends : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<RecommendModelListHotrecommendsList *> *list;

@end

@interface RecommendModelListHotrecommendsList : NSObject

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<RecommendModelListHotrecommendsListList *> *list;

@property (nonatomic, assign) NSInteger categoryType;

@property (nonatomic, assign) BOOL filterSupported;

@end

@interface RecommendModelListHotrecommendsListList : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger commentsCount;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *coverLarge;

@end

