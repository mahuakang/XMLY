//
//  AblumTableViewController.h
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewController : UITableViewController
@property (nonatomic,assign)NSInteger albumUid;
@property (nonatomic,copy)NSString *statMoudle;
@property (nonatomic,copy)NSString *pageType;
- (instancetype)initWithList:(NSInteger)albumUid statMoudle:(NSString *)statMoudle pageType:(NSString*)pageType;
@end
