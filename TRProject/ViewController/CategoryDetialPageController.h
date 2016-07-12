//
//  CatrgoryDetialPageController.h
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <WMPageController/WMPageController.h>

@interface CategoryDetialPageController : WMPageController
@property (nonatomic,assign)NSInteger Id;
@property (nonatomic,copy)NSString *statMoudle;
@property (nonatomic,copy)NSString *pageType;
- (instancetype)initWithId:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType;
@end
