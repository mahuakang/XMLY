//
//  OtherPageTableViewController.h
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherPageTableViewController : UITableViewController
@property (nonatomic,assign)NSInteger Id;
@property (nonatomic,strong)NSString *tagName;
- (instancetype)initWithId:(NSInteger)Id tagName:(NSString *)tagName;
@end
