//
//  Horizontal3on1Cell.h
//  TRProject
//
//  Created by kfc on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

@interface Horizontal3on1Cell : UITableViewCell
@property (nonatomic,assign)NSInteger currentSession;
@property (nonatomic,strong)RecommendModelEditorrecommendalbums *editorRecommend;
@property (nonatomic,strong)RecommendModelListHotrecommendsList *listDetial;
- (instancetype)initWithList:(RecommendModelListHotrecommendsList *)listDetial andEdit:(RecommendModelEditorrecommendalbums *)editorRecommend andCuccentSession:(NSInteger)currentSession;
@end
