//
//  RadioCategoryTableViewController.h
//  TRProject
//
//  Created by kfc on 16/7/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioCategoryTableViewController : UITableViewController
@property (nonatomic,assign)NSInteger Id;
@property (nonatomic,copy)NSString *name;
- (instancetype)initWithId:(NSInteger)Id CategoryName:(NSString*)name;
@end
