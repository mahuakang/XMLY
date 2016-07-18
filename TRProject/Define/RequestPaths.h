//
//  RequestPaths.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#ifndef RequestPaths_h
#define RequestPaths_h

#define RecommendPath @"http://mobile.ximalaya.com/mobile/discovery/v3/recommends?channel=and-d5&device=iphone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.9"

#define RecommendListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/recommend/hotAndGuess?device=iphone"

#define CatrgoryPath @"http://mobile.ximalaya.com/mobile/discovery/v1/categories?channel=and-d5&device=iphone&picVersion=13&scale=2"

#define RadioPath @"http://live.ximalaya.com/live-web/v4/homepage"

#define ListPath @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=and-a1&device=iphone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.9"

#define AblumDetialPathRight @"http://mobile.ximalaya.com/mobile/v1/album?albumId=%ld&device=iphone&isAsc=true&pageId=1&pageSize=20&pre_page=0&source=5&statEvent=pageview/album@%ld&statModule=%@&statPage=tab@%@&statPosition=1"

#define AblumDetialPathLeft @"http://mobile.ximalaya.com/mobile/v1/album/detail?albumId=4371702&device=iphone&statEvent=pageview/album@%ld&statModule=%@&statPage=tab@%@&statPosition=1"

#define ListenListPath @"http://mobile.ximalaya.com/m/subject_detail?device=iphone&id=%ld&statEvent=pageview/subject@%ld&statModule=%@&statPage=tab@%@&statPosition=1"

#define WmNumPath @"http://mobile.ximalaya.com/mobile/discovery/v1/category/tagsWithoutCover?categoryId=%ld&channel=and-d5&contentType=album&device=iphone&statEvent=pageview/category@%@&statModule=%@&statPage=tab@%@&version=5.4.9"

#define WmOtherPage @"http://mobile.ximalaya.com/mobile/discovery/v1/category/album?calcDimension=hot&categoryId=%ld&device=iphone&pageId=1&pageSize=20&status=0&tagName=%@"

#define WmFirstPage @"http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=%ld&contentType=album&device=iphone&version=5.4.9"

#define RadiocategoryPath @"http://live.ximalaya.com/live-web/v2/radio/category?categoryId=%ld&pageNum=%ld&pageSize=20"

#define bandanDetialPath @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/%@?device=android&key=%@&pageId=1&pageSize=20&scale=2"

#endif /* RequestPaths_h */






