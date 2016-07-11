//
//  ListenListTableViewController.h
//  TRProject
//
//  Created by kfc on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListenListTableViewController : UITableViewController
@property (nonatomic,assign)NSInteger Id;
@property (nonatomic,copy)NSString *statMoudle;
@property (nonatomic,copy)NSString *pageType;
- (instancetype)initWithList:(NSInteger)Id statMoudle:(NSString *)statMoudle pageType:(NSString *)pageType;
@end
