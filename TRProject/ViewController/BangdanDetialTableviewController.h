//
//  BangdanDetialTableviewController.h
//  TRProject
//
//  Created by kfc on 16/7/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BangdanDetialTableviewController : UITableViewController
@property (nonatomic,copy)NSString *contentType;
@property (nonatomic,copy)NSString *key;
- (instancetype)initWithType:(NSString*)contentType key:(NSString *)key;
@end
