//
//  FirstPageTableViewController.h
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface FirstPageTableViewController : UITableViewController
@property (nonatomic,assign)NSInteger Id;
- (instancetype)initWithId:(NSInteger)Id;
@end
